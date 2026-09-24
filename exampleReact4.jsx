// Recebe 'status' do componente pai através da desestruturação de props
function StatusBadge({ status }) {
  // Define a cor 'green' se for 'online', senão define 'red'
  const cor = status === 'online' ? 'green' : 'red'; 
  
  // Retorna o texto formatado com a cor calculada
  return <span style={{ color: cor }}>{status}</span>; 
}

// Componente principal
export function App() {
  return (
    <div>
      {/* Passa a prop status="online" para o primeiro badge */}
      <p>Servidor 1: <StatusBadge status="online" /></p> 
      
      {/* Passa a prop status="offline" para o segundo badge */}
      <p>Servidor 2: <StatusBadge status="offline" /></p> 
    </div>
  );
}