package rules

excluded_namespaces = [
	"istio-system",

]

check_excluded(namespace, allowlist) {
	namespace == allowlist[_]
}


service_denyloadbalancer = [
	"LoadBalancer",

]

check_service_type(service_type, denylist) {
	service_type == denylist[_]
}





deny[msg] {
	input.kind == "Service"
	input.metadata.namespace != 
	check_service_type(input.spec.type, service_denyloadbalancer)
	not check_excluded(input.metadata.namespace,excluded_namespaces)
	msg := {
		"publicId": "CUSTOM-RULE-2",
		"title": "Block LoadBalancer Services",
		"severity": "high",
		"msg": "input.spec.type",
		"issue": "",
		"impact": "",
		"remediation": "",
		"references": [],
	}
}
