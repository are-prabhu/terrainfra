output "cache_nodes" {
  value = "${aws_elasticache_cluster.elasticache.cache_nodes}"
}

output "elasticache_endpoint" {
  value = "${aws_elasticache_cluster.elasticache.cache_nodes.0.address}"
}

output "elasticache_port" {
  value = "${aws_elasticache_cluster.elasticache.cache_nodes.0.port}"
}
