resource "aws_s3_object" "delta_insert" {
  bucket = "${var.prefix_name}-${var.bucket_names[0]}-${var.account_id}"
  key    = "emr-code/pyspark/01_delta_spark_insert.py"
  source = "../etl/01_delta_spark_insert.py"
  etag   = filemd5("../etl/01_delta_spark_insert.py")

  depends_on = [
    aws_s3_bucket.buckets
  ]
}

resource "aws_s3_object" "delta_upsert" {
  bucket = "${var.prefix_name}-${var.bucket_names[0]}-${var.account_id}"
  key    = "emr-code/pyspark/02_delta_spark_upsert.py"
  source = "../etl/02_delta_spark_upsert.py"
  etag   = filemd5("../etl/02_delta_spark_upsert.py")

  depends_on = [
    aws_s3_bucket.buckets
  ]
}