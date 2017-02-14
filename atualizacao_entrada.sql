BEGIN
  DBMS_SCHEDULER.CREATE_JOB (
   job_name          =>  'atualizacao_entrada',
   program_name      =>  'update_entrada',
   repeat_interval   =>  'FREQ=DAILY;BYHOUR=0',
   comments          =>  'Atualiza o valor do atributo entrada do sócio para
   0, caso a data de terminação do contrato seja anterior à data do sistema');
END;
