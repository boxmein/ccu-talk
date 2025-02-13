

resource "aws_iam_role" "custodian" {
  tags = {
    CloudCustodianDemo = "true"
  }
  name               = "custodian"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_policy" "custodian_access" {
  tags = {
    CloudCustodianDemo = "true"
  }
  name        = "custodian_access"
  description = "Policy for Custodian to access AWS resources"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "autoscaling:DescribeLaunchConfigurations", 
        "batch:DescribeComputeEnvironments", 
        "ec2:CreateTags",
        "ec2:DeleteSecurityGroup",
        "ec2:DeleteTags",
        "ec2:DescribeNetworkInterfaces", 
        "ec2:DescribeSecurityGroups",
        "ec2:DescribeSecurityGroups", 
        "ec2:DescribeTags",
        "events:ListTargetsByRule", 
        "lambda:ListFunctions", 
        "lambda:ListTags", 
        "s3:GetBucketPublicAccessBlock",
        "s3:ListAllMyBuckets",
        "s3:PutBucketPublicAccessBlock",
        "securityhub:BatchImportFindings",
        "securityhub:BatchUpdateFindings",
        "securityhub:GetFindings",
        "tag:GetResources" 
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "custodian_access" {
  role       = aws_iam_role.custodian.name
  policy_arn = aws_iam_policy.custodian_access.arn
}

resource "aws_iam_role_policy_attachment" "custodian_lambda_basic_execution" {
  role       = aws_iam_role.custodian.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "custodian_config_rules_execution" {
  role       = aws_iam_role.custodian.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRulesExecutionRole"
}
