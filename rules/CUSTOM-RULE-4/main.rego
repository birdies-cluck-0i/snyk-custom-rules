
package rules

allowed_repos := [
    "k8s.gcr.io/",
    "docker.io/",
    "quay.io/"
]


is_allowed(image, allowed_repos) {
	startswith(image, allowed_repos[_])
}

deny[msg] {
  container := input.spec.containers[_]
  image := container.image
  not is_allowed(image, allowed_repos)
  msg := {
	"publicId": "CUSTOM-RULE-4",
	"title": "Images can only be pulled from allowed repos",
	"severity": "high",
	"msg": "input.spec.type",
	"issue": "",
	"impact": "",
	"remediation": "",
	"references": [],
 }
}


deny[msg] {
  container := input.spec.initcontainers[_]
  image := container.image
  is_allowed(image, allowed_repos)
  msg := {
	"publicId": "CUSTOM-RULE-4",
	"title": "Images can only be pulled from allowed repos",
	"severity": "high",
	"msg": "input.spec.type",
	"issue": "",
	"impact": "",
	"remediation": "",
	"references": [],
 }
}