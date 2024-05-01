docker run -d --name dd-agent \
--network mynetwork \
-e DD_API_KEY=90cb01c5cf6e6752e1d3948f1cb7ad4a \
-e DD_SITE="ap1.datadoghq.com" \
-e DD_APM_ENABLED=true \
-e DD_APPSEC_ENABLED=true \
-e DD_IAST_ENABLED=true \
-e DD_APM_NON_LOCAL_TRAFFIC=true \
-e DD_PROCESS_CONFIG_PROCESS_COLLECTION_ENABLED=true \
-e DD_APM_RECEIVER_SOCKET=/opt/datadog/apm/inject/run/apm.socket \
-e DD_DOGSTATSD_SOCKET=/opt/datadog/apm/inject/run/dsd.socket \
-v /opt/datadog/apm:/opt/datadog/apm \
-v /etc/passwd:/etc/passwd:ro \
-v /var/run/docker.sock:/var/run/docker.sock:ro \
-v /proc/:/host/proc/:ro \
-v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
-v /var/lib/docker/containers:/var/lib/docker/containers:ro \
gcr.io/datadoghq/agent:7
