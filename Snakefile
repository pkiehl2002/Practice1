rule all:
	input:
		expand("results/trimmed1_{sample}.fastq.gz", sample = config["samples"])
		
rule fastp:
	input:
		forward = "{sample}.fastq.gz"
	output:
		forwardOutput = "results/trimmed1_{sample}.fastq.gz",
		report = "results/{sample}.html"
	shell:
		"fastp -i {input.forward} -o {output.forwardOutput} -h {output.report}"