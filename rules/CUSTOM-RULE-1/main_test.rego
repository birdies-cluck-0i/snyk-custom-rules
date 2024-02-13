package rules

import data.lib
import data.lib.testing

test_CUSTOM_RULE_1 {
	# array containing test cases where the rule is allowed
	allowed_test_cases := [{
		"want_msgs": [],
		"fixture": "allowed.yaml",
	}]

	# array containing cases where the rule is denied
	denied_test_cases := [
	{
		"want_msgs": ["input.spec.replicas"],
		"fixture": "denied_min.yaml",
	},
	{
		"want_msgs": ["input.spec.replicas"],
		"fixture": "denied_max.yaml",
	},
	]

	test_cases := array.concat(allowed_test_cases, denied_test_cases)
	testing.evaluate_test_cases("CUSTOM-RULE-1", "./rules/CUSTOM-RULE-1/fixtures", test_cases)
}
