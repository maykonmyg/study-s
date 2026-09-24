import { useState } from 'react'; // Importa o Hook de estado do React

export default function App() {
  // 1. ESTADOS DA APLICAÇÃO
  // Lista inicial de dados (Simula o banco/API)
  const [servidores, setServidores] = useState([
    { id: 1, nome: 'Servidor Web', ip: '192.168.1.10' },
    { id: 2, nome: 'Banco de Dados', ip: '192.168.1.20' }
  ]);

  // Estados dos campos do formulário
  const [nome, setNome] = useState('');
  const [ip, setIp] = useState('');

  // Estado para saber se estamos editando alguém (guarda o ID) ou criando (null)
  const [editandoId, setEditandoId] = useState(null);

  // 2. FUNÇÃO SALVAR (CREATE / UPDATE)
  const handleSalvar = (e) => {
    e.preventDefault(); // Impede o recarregamento da página

    if (!nome || !ip) return; // Validação simples para não salvar campos vazios

    if (editandoId) {
      // --- UPDATE (ATUALIZAR) ---
      // Mapeia a lista e altera apenas o item que possui o ID em edição
      setServidores(servidores.map(s => 
        s.id === editandoId ? { ...s, nome, ip } : s
      ));
      setEditandoId(null); // Sai do modo de edição
    } else {
      // --- CREATE (CRIAR) ---
      // Cria um novo objeto com um ID único (usando a data atual)
      const novoServidor = { id: Date.now(), nome, ip };
      setServidores([...servidores, novoServidor]); // Adiciona o novo item ao array
    }

    // Limpa os campos do formulário após salvar
    setNome('');
    setIp('');
  };

  // 3. FUNÇÃO PREPARAR EDIÇÃO
  const handleEditar = (servidor) => {
    setEditandoId(servidor.id); // Define qual ID está sendo editado
    setNome(servidor.nome);     // Preenche o campo nome com os dados atuais
    setIp(servidor.ip);         // Preenche o campo IP com os dados atuais
  };

  // 4. FUNÇÃO DELETAR (DELETE)
  const handleDeletar = (id) => {
    // Filtra a lista mantendo apenas os itens com ID diferente do selecionado
    setServidores(servidores.filter(s => s.id !== id));
  };

  // 5. CANCELAR EDIÇÃO
  const handleCancelar = () => {
    setEditandoId(null);
    setNome('');
    setIp('');
  };

  return (
    <div style={{ padding: '20px', fontFamily: 'sans-serif', maxWidth: '500px' }}>
      <h2>Mini-CRUD de Servidores</h2>

      {/* FORMULÁRIO (CRIAR / ATUALIZAR) */}
      <form onSubmit={handleSalvar} style={{ marginBottom: '20px' }}>
        <input
          type="text"
          placeholder="Nome do Servidor"
          value={nome}
          onChange={(e) => setNome(e.target.value)}
          style={{ display: 'block', marginBottom: '8px', width: '100%', padding: '6px' }}
        />
        <input
          type="text"
          placeholder="Endereço IP"
          value={ip}
          onChange={(e) => setIp(e.target.value)}
          style={{ display: 'block', marginBottom: '8px', width: '100%', padding: '6px' }}
        />

        <button type="submit" style={{ padding: '6px 12px', marginRight: '8px' }}>
          {editandoId ? 'Atualizar' : 'Cadastrar'}
        </button>

        {/* Mostra botão de cancelar apenas se estiver no modo de edição */}
        {editandoId && (
          <button type="button" onClick={handleCancelar} style={{ padding: '6px 12px' }}>
            Cancelar
          </button>
        )}
      </form>

      <hr />

      {/* LISTA (READ / DELETE / TRIGGER EDIT) */}
      <h3>Lista de Servidores ({servidores.length})</h3>
      
      {servidores.length === 0 ? (
        <p>Nenhum servidor cadastrado.</p>
      ) : (
        <ul style={{ listStyle: 'none', padding: 0 }}>
          {servidores.map((s) => (
            <li 
              key={s.id} 
              style={{ 
                padding: '8px', 
                borderBottom: '1px solid #ccc', 
                display: 'flex', 
                justifyContent: 'space-between',
                alignItems: 'center'
              }}
            >
              <span><strong>{s.nome}</strong> - {s.ip}</span>
              <div>
                <button 
                  onClick={() => handleEditar(s)} 
                  style={{ marginRight: '6px' }}
                >
                  Editar
                </button>
                <button onClick={() => handleDeletar(s.id)}>
                  Excluir
                </button>
              </div>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}