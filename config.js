// Preencha com os dados do seu Supabase e do EmailJS (veja o LEIA-ME.md).
// Estas chaves são públicas por natureza: a segurança fica nas regras do banco (setup.sql).
window.CONFIG = {
  STORE_NAME: 'Meu Catálogo',

  // Supabase  ->  Project Settings > API
  SUPABASE_URL: 'COLE_AQUI_A_URL_DO_PROJETO',
  SUPABASE_ANON_KEY: 'COLE_AQUI_A_CHAVE_ANON_PUBLIC',

  // EmailJS  ->  Account > General (public key), Email Services, Email Templates
  EMAILJS_PUBLIC_KEY: 'COLE_AQUI_A_PUBLIC_KEY',
  EMAILJS_SERVICE_ID: 'COLE_AQUI_O_SERVICE_ID',
  EMAILJS_TEMPLATE_ID: 'COLE_AQUI_O_TEMPLATE_ID'
};
