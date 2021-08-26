#!/bin/bash
#
#
JAVA_OPTIONS=-Dtks.skipsignlogs=Y

MODE=-httpinterceptor

case $1 in
	F)
	# forward all
	PROPS=tkw_forward_all.properties
	;;

	SF)
	# secure forward
	PROPS=tkw_forward_all_secure.properties
	;;

	S)
	# secure simulator
	PROPS=tkw_secure.properties
	;;

	*)
	# default simulate some
	PROPS=tkw-x.properties
	#PROPS=tkw.properties
	;;
esac

if [[ "$2" != "" ]]
then
	sed -e "/HttpTransport\.listenport/s/4848/$2/" < $PROPS > temp
	PROPS=temp
fi

#$JDK8/bin/java $JAVA_OPTIONS -jar ../../TKW.jar $MODE $PROPS
$JDK11/bin/java $JAVA_OPTIONS -jar ../../TKW-x.jar $MODE $PROPS
rm -f temp
