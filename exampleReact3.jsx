// Lê a variável de ambiente do arquivo .env quando usa Vite
const API_URL = import.meta.env.VITE_API_URL; 

// Lê a variável de ambiente se estiver usando Create React App (CRA)
// const API_URL = process.env.REACT_APP_API_URL;

export function App() {
  // Exibe a URL capturada no HTML final renderizado
  return <p>Conectado em: {API_URL}</p>; 
}