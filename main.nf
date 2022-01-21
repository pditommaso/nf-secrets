nextflow.enable.dsl=2

process someTask {
  secret 'FOO'
  secret 'BAR'
  output: 
     stdout 
  script:
  '''
    echo "Secrets phrase: $FOO $BAR"
  '''
}

workflow {
  someTask().view()
}
