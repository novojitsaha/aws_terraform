data "aws_ssm_parameter" "al2023_arm64_param" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-arm64"
}