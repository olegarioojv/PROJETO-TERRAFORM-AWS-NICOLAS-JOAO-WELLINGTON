output "vpc_id" {
  description = "ID da VPC criada"
  value       = aws_vpc.main.id
}

output "subnet_id" {
  description = "ID da subnet publica principal criada"
  value       = aws_subnet.public.id
}

output "subnet_b_id" {
  description = "ID da segunda subnet publica criada (ALB)"
  value       = aws_subnet.public_b.id
}

output "private_subnet_id" {
  description = "ID da subnet privada criada (RDS)"
  value       = aws_subnet.private.id
}

output "internet_gateway_id" {
  description = "ID do Internet Gateway criado"
  value       = aws_internet_gateway.main.id
}

output "route_table_id" {
  description = "ID da Route Table publica criada"
  value       = aws_route_table.public.id
}

output "security_group_rds_id" {
  description = "ID do Security Group do RDS"
  value       = aws_security_group.rds.id
}

output "db_endpoint" {
  description = "Endpoint (host) da instancia RDS"
  value       = aws_db_instance.main.address
}

output "db_port" {
  description = "Porta da instancia RDS"
  value       = aws_db_instance.main.port
}

output "alb_dns_name" {
  description = "DNS publico do Application Load Balancer — URL da aplicacao"
  value       = aws_lb.main.dns_name
}

output "ecs_cluster_name" {
  description = "Nome do cluster ECS — usado no deploy.yml e nos comandos aws ecs"
  value       = aws_ecs_cluster.main.name
}

output "ecs_service_frontend" {
  description = "Nome do Service ECS do frontend — usado no deploy.yml"
  value       = aws_ecs_service.frontend.name
}

output "ecs_service_api" {
  description = "Nome do Service ECS da api — usado no deploy.yml"
  value       = aws_ecs_service.api.name
}

output "ecr_repository_frontend" {
  description = "URL do repositorio ECR do frontend — usado no docker push e no deploy.yml"
  value       = aws_ecr_repository.frontend.repository_url
}

output "ecr_repository_api" {
  description = "URL do repositorio ECR da api — usado no docker push e no deploy.yml"
  value       = aws_ecr_repository.api.repository_url
}
