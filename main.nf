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


workflow.onComplete {
    def msg = """\
        Pipeline execution summary
        ---------------------------
        Completed at: ${workflow.complete}
        Duration    : ${workflow.duration}
        Success     : ${workflow.success}
        workDir     : ${workflow.workDir}
        exit status : ${workflow.exitStatus}
        """
        .stripIndent()

    sendMail(to: 'paolo.ditommaso@gmail.com', subject: 'My pipeline execution', body: msg)
}
