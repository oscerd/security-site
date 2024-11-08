#!/bin/zsh

# look at SBOMs in sboms/{pmc} and generate release SBOMs description in sboms/{pmc}/{project}-{version}.md
# that lists the SBOMs associated to the release, and for each a high-level summary:
# - what is the SBOM describing? = the content of metadata
# - what are the components from the release (the BOM)? = the content of components

describe="$(pwd)/scripts/describe_sboms.java"

function describeReleasesFromBasedir() {
  local pmc=$1
  local name=$2
  local basedir=$3

  echo "> describing $name SBOMs"
  cd sboms/$pmc
  for d in */$basedir/*
  do
    local version=$(basename $d)
    echo "  > describing $name $version"
    $describe $name $version $d/*.(xml|json) > $pmc-$version.md
  done
  cd ../..
}

function describeReleasesFromBase() {
  local pmc=$1
  local name=$2
  local id=$3
  local baseDir=$4
  local baseSub=$5
  [ "$id" = "-" ] && id=$pmc

  echo "> describing $name SBOMs"
  cd sboms/$pmc
  local version
  for version in $(echo "$(for d in */$baseDir*/$baseSub*/* ; do filename $d ; done)" | sort -u)
  do
    echo "  > describing $name $version"
    $describe $name $version */$baseDir*/$baseSub*/$version/*.(xml|json) > $id-$version.md
  done
  cd ../..
}

describeReleasesFromBasedir airflow Airflow apache-airflow

describeReleasesFromBase arrow Arrow -
describeReleasesFromBase avro Avro -
describeReleasesFromBase camel Camel -
# TODO commons
describeReleasesFromBase cxf CXF -
describeReleasesFromBase directory Directory - org.apache.directory
describeReleasesFromBase directory Kerby kerby org.apache.kerby
describeReleasesFromBase druid Druid -
describeReleasesFromBase flink Flink -
describeReleasesFromBase groovy Groovy -
describeReleasesFromBase hadoop Hadoop -
describeReleasesFromBase hbase HBase -
describeReleasesFromBase hop Hop -
describeReleasesFromBase jena Jena -
describeReleasesFromBase jspwiki JSPWiki -
describeReleasesFromBase logging Log4j log4j
# TODO maven
describeReleasesFromBase orc ORC -
describeReleasesFromBase parquet Parquet -
describeReleasesFromBase pekko Pekko -
describeReleasesFromBase ratis Ratis -
describeReleasesFromBase santuario Santuario -
describeReleasesFromBase skywalking SkyWalking -
describeReleasesFromBase spark Spark -
describeReleasesFromBase syncope Syncope -
describeReleasesFromBase turbine Turbine - org.apache.turbine
describeReleasesFromBase turbine Fulcrum fulcrum org.apache.fulcrum
describeReleasesFromBase zookeeper Zookeeper -
