resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  #public_key = file("./aws-key.pub")
  public_key = file(var.aws_pub_key)
}

resource "aws_instance" "vm" {
  ami                         = "ami-007855ac798b5175e" # us-west-2
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true
  tags = {
    "Name" = "vm-terraform"
  }

  #network_interface {
  #  network_interface_id = aws_network_interface.foo.id
  #  device_index         = 0
  #}

  #credit_specification {
  #  cpu_credits = "unlimited"
  #}
}

#para gerar as chaves: ssh-keygen -f aws-key (no proprio terminal do vscode dentro da pasta raiz)
#para acessar a instância ec2 via terminal vscode: ssh -i aws-key ubuntu@[ip_retornado_vm_ip]