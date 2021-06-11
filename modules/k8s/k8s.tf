resource "kubernetes_deployment" "deployment" {
  metadata {
    name = "zammad-deployment"
    labels = {
      test = "MyExampleApp"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        test = "MyExampleApp"
      }
    }

    template {
      metadata {
        labels = {
          test = "MyExampleApp"
        }
      }

      spec {
        container {
          #          name              = "nginx"
          #          image             = "nginx:latest"
          name              = "zammad"
          image             = "zammad/zammad:latest"
          image_pull_policy = "IfNotPresent"

          /*          liveness_probe {
            http_get {
              path = "/nginx_status"
              port = 80

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }
            initial_delay_seconds = 3
            period_seconds        = 3
          }*/
        }
      }
    }
  }
}

resource "kubernetes_service" "service" {
  metadata {
    name = "zammad-deployment"
  }
  spec {
    selector = {
      test = "MyExampleApp"
    }
    port {
      name        = "http"
      port        = 80
      target_port = 80
    }

    port {
      name        = "test"
      port        = 8080
      target_port = 8080
    }

    port {
      name        = "sql"
      port        = 5432
      target_port = 5432
    }

    type = "LoadBalancer"
  }
}
