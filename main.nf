nextflow.enable.dsl=2

process someTask {
  secret 'FOO'
  secret 'BAR'
  script:
  /
    echo "Secrets phrase: \$FOO \$BAR"
  /
}

workflow {
  someTask()
}
