package rules

import data.lib
import data.lib.testing

test_CUSTOM_RULE_4 {
	# array containing test cases where the rule is allowed
	allowed_test_cases := [
	{
		"want_msgs": [],
		"fixture": "allowed.yaml",
	},	
	{
		"want_msgs": [],
		"fixture": "allowed-all.yaml",
	}

	]

	# array containing cases where the rule is denied
	denied_test_cases := [{
		"want_msgs": ["input.spec.type"],
		"fixture": "denied.yaml",
	}
	]

	test_cases := array.concat(allowed_test_cases, denied_test_cases)
	testing.evaluate_test_cases("CUSTOM-RULE-4", "./rules/CUSTOM-RULE-4/fixtures", test_cases)
}
