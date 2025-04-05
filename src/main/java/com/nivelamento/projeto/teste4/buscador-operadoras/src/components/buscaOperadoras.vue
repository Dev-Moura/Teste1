<template>
    <div class="p-4 max-w-xl mx-auto">
      <h1 class="text-2xl font-bold mb-4">Buscar Operadoras</h1>
      <input
        v-model="busca"
        @input="buscar"
        placeholder="Digite a razão social..."
        class="border p-2 w-full rounded"
      />
  
      <ul v-if="resultados.length" class="mt-4 space-y-2">
        <li v-for="op in resultados" :key="op.registro_ans" class="border p-2 rounded shadow">
          <strong>{{ op.razao_social }}</strong><br />
          CNPJ: {{ op.cnpj }}
        </li>
      </ul>
    </div>
  </template>
  
  <script setup>
  import { ref } from 'vue'
  import axios from 'axios'
  
  const busca = ref('')
  const resultados = ref([])
  
  const buscar = async () => {
    if (busca.value.length < 3) {
      resultados.value = []
      return
    }
  
    const res = await axios.get(`http://127.0.0.1:5000/buscar-operadoras?q=${busca.value}`)
    resultados.value = res.data
  }
  </script>
  