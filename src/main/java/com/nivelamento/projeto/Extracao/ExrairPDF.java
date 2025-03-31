package com.nivelamento.projeto.Extracao;

import java.io.*;
import java.nio.file.*;
import java.util.zip.*;
import org.apache.pdfbox.pdmodel.*;
import org.apache.pdfbox.text.PDFTextStripper;

public class ExrairPDF {
    public static void main(String[] args) throws IOException {
        String pdfPath = "downloads/anexos/Anexo_I..pdf";
        String csvPath = "downloads/Rol_Procedimentos.csv";
        String zipPath = "downloads/Teste_Michael.zip";

        String text = extrairTextoDoPDF(pdfPath);
        salvarComoCSV(text, csvPath);
        compactarCSV(csvPath, zipPath);
    }

    private static String extrairTextoDoPDF(String pdfPath) throws IOException {
        try (PDDocument document = PDDocument.load(new File(pdfPath))) {
            PDFTextStripper stripper = new PDFTextStripper();
            return stripper.getText(document);
        }
    }

    private static void salvarComoCSV(String text, String csvPath) throws IOException {
        try (BufferedWriter writer = Files.newBufferedWriter(Paths.get(csvPath))) {
            writer.write("Codigo,Descricao,OD,AMB\n"); // Cabeçalho
            String[] linhas = text.split("\n");
            for (String linha : linhas) {
                if (linha.matches("\\d{3}.*")) {
                    linha = linha.replace("OD", "Odontologia").replace("AMB", "Ambulatorial");
                    writer.write(linha + "\n");
                }
            }
        }
    }

    private static void compactarCSV(String csvPath, String zipPath) throws IOException {
        try (ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(zipPath));
             FileInputStream fis = new FileInputStream(csvPath)) {
            zos.putNextEntry(new ZipEntry("Rol_Procedimentos.csv"));
            byte[] buffer = new byte[1024];
            int len;
            while ((len = fis.read(buffer)) > 0) {
                zos.write(buffer, 0, len);
            }
        }
    }
}

