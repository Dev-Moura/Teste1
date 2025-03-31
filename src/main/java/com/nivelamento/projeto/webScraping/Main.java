package com.nivelamento.projeto.webScraping;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import java.io.*;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
public class Main {
    public static void main(String[] args) {
        String url = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos";
        String downloadDir = "downloads/";
        String zipFilePath = "downloads/anexos.zip";

        try {
            // Garante que a pasta de downloads existe
            Files.createDirectories(Paths.get(downloadDir));

            Document doc = Jsoup.connect(url).get();
            List<Element> pdfLinks = doc.select("a[href$=.pdf]");

            boolean foundFiles = false;
            try (FileOutputStream fos = new FileOutputStream(zipFilePath);
                 ZipOutputStream zipOut = new ZipOutputStream(fos)) {

                for (Element link : pdfLinks) {
                    String pdfUrl = link.absUrl("href");
                    String fileName = link.text().trim();

                    // Verifica se o nome do arquivo contém "Anexo I" ou "Anexo II"
                    if (fileName.toLowerCase().contains("anexo i") || fileName.toLowerCase().contains("anexo ii")) {
                        System.out.println("Baixando: " + fileName + " de " + pdfUrl);
                        byte[] pdfData = downloadFile(pdfUrl);
                        if (pdfData != null) {
                            addToZip(zipOut, fileName.replace(" ", "_") + ".pdf", pdfData);
                            foundFiles = true;
                        }
                    }
                }
            }

            if (!foundFiles) {
                System.out.println("Nenhum arquivo Anexo I ou Anexo II encontrado.");
            } else {
                System.out.println("Download e compactação concluídos!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static byte[] downloadFile(String fileUrl) {
        try (InputStream in = new URL(fileUrl).openStream();
             ByteArrayOutputStream bos = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = in.read(buffer)) != -1) {
                bos.write(buffer, 0, bytesRead);
            }
            return bos.toByteArray();
        } catch (Exception e) {
            System.out.println("Erro ao baixar: " + fileUrl);
            e.printStackTrace();
            return null;
        }
    }

    private static void addToZip(ZipOutputStream zipOut, String fileName, byte[] fileData) throws IOException {
        ZipEntry zipEntry = new ZipEntry(fileName);
        zipOut.putNextEntry(zipEntry);
        zipOut.write(fileData);
        zipOut.closeEntry();
    }
}
