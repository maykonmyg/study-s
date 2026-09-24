import { useState, useEffect } from 'react'; // Importa os dois Hooks principais do React

export function ListaServidores() {
  const [servidores, setServidores] = useState([]); // Guarda a lista vinda da API (começa vazia)
  const [loading, setLoading] = useState(true);     // Controla a mensagem de "Carregando" (começa visível)

  useEffect(() => { // Executa o código assim que o componente carrega na tela
    fetch('https://api.exemplo.com/servers') // Faz a requisição HTTP para a API
      .then((res) => res.json())             // Converte a resposta bruta em objeto JSON
      .then((data) => {
        setServidores(data);                 // Salva os dados recebidos no estado
        setLoading(false);                   // Desativa o aviso de carregamento
      })
      .catch(() => setLoading(false));       // Se der erro, desativa o carregamento para não travar a tela
  }, []); // Array vazio = executa apenas 1 vez quando a tela abre

  if (loading) return <p>Carregando...</p>; // Mostra essa mensagem enquanto 'loading' for verdadeiro

  return (
    <ul>
      {/* Mapeia o array e desenha um item <li> para cada elemento */}
      {servidores.map((item) => (
        <li key={item.id}>{item.nome}</li> // O atributo 'key' é obrigatório no React
      ))}
    </ul>
  );
}