# Experimento de escalabilidad
El objetivo del experimento es conocer la capacidad de la aplicación para garantizar que el 100% de las peticiones respondan exitosamente en menos de 5 segundos con 1000 solicitudes concurrentes.

Usamos Terratorm como herramienta de Infraestructura como codigo y creamos y aprovisionamos modulos de infraestructura en AWS.

Prerequisitos
Install terraform para AWS, 
AWS CLI,
Y tener una cuenta asociada en AWS
todo lo anterior se puede seguir con la siguiente URL
https://developer.hashicorp.com/terraform/tutorials/aws-get-started

para ejecutar terraform y crear la infraestructura seguir los siguiente
#### Running terraform
validar que los archivos sean legibles y consistentes
```
scaling_experiment-/terrainfra> terraform validate
```
Iniciar y crear la infraestructura
```
scaling_experiment-/terrainfra> terraform init
scaling_experiment-/terrainfra> terraform apply
```
