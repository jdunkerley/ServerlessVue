
resource "aws_ssm_parameter" "test_lambda" {
  name      = "test_${var.region}_${var.name}"
  type      = "String"
  value     = var.account_id
  overwrite = true
}
