package rules

service_denynodeport = [
	"NodePort",

]

check_service_type(service_type, denylist) {
	service_type == denylist[_]
}


deny[msg] {
	input.kind == "Service"
	check_service_type(input.spec.type, service_denynodeport )
	msg := {
		"publicId": "CUSTOM-RULE-3",
		"title": "Block NodePort Services",
		"severity": "high",
		"msg": "input.spec.type",
		"issue": "",
		"impact": "",
		"remediation": "",
		"references": [],
	}
}
