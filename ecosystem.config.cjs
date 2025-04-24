module.exports = {
  apps: [
    {
      name: 'Suntrust V1 - CMS',
      port: 7078,
      exec_mode: 'cluster',
      instances: '2',
      max_memory_restart: '200M',
      script: '.output/server/index.mjs',
    },
  ]
};
