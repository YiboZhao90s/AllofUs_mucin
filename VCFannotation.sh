# The workflow is: cp vcf.bgz file to workspace -> vcftools --freq --out -> awk $1=="chr11" -> download trimmed file
%%bash
gsutil -u terra-vpc-sc-7210ba51 cp gs://fc-aou-datasets-controlled/v8/wgs/long_read/BI/revio/joint_call/GRCh38/v8.BI_Rev_mid.QualFT40.g.vcf.bgz* /home/jupyter/workspaces/muc5acsv/
/usr/local/bin/vcftools --gzvcf v8.BCM_Seq_high.QualFT40.g.vcf.bgz --freq --out variant_freq
awk '$1 == "chr11"' variant_freq.frq.frq > variant_chr11.frq
## download result file
rm *vcf.bgz
rm *frq
