function put_metrics_data() {
  aws --region ${REGION} cloudwatch put-metric-data \
    --namespace "${NAMESPACE}" \
    --metric-data file:///${TMPDIR}/${1}.json
}
