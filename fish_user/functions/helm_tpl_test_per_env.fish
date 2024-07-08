function helm_tpl_test_per_env
	set -f HELM_ENV $argv[1]
	if not set -q HELM_ENV[1]
		set -f HELM_ENV stg
	end
	set -f CMD helm template ./ -f values/$HELM_ENV/values.yaml -f values/$HELM_ENV/revisions.yaml
	echo $CMD
	command $CMD
end
