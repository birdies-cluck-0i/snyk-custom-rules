
package rules

min_replicas := 2
max_replicas := 5

deny[msg] {
    input.kind == "Deployment"
    below_min_replicas(input, min_replicas)
   

	msg := {
		"publicId": "CUSTOM-RULE-1",
		"title": "Check Minimum replicas",
		"severity": "high",
		"msg": "input.spec.replicas",
		"issue": "",
		"impact": "",
		"remediation": "",
		"references": [],
	}
}

deny[msg] {
    input.kind == "Deployment"

    exceeds_max_replicas(input, max_replicas)

	msg := {
		"publicId": "CUSTOM-RULE-1",
		"title": "Check Minimum replicas",
		"severity": "high",
		"msg": "input.spec.replicas",
		"issue": "",
		"impact": "",
		"remediation": "",
		"references": [],
	}
}


exceeds_max_replicas(deployment, max_replicas) {
    deployment.kind == "Deployment"
    deployment.spec.replicas > max_replicas
}

below_min_replicas(deployment, min_replicas) {
    deployment.kind == "Deployment"
    deployment.spec.replicas < min_replicas
}
