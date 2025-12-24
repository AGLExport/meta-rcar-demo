#!/bin/bash

# Workaround: Modify build.ninja to inherit rm_work, since Moulin does not support the += syntax.
# Additionally, apply RM_WORK_EXCLUDE to certain tasks to prevent build errors caused by references to intermediate files in the work directories.
sed -i -e "s/conf\ =\ /conf\ =\ \
    \'INHERIT\ \+\=\ \"rm_work\"\'\ \
    \'RM_WORK_EXCLUDE\ \+\=\ \" xen\"\'\ \
    \'RM_WORK_EXCLUDE\ \+\=\ \" xen-tools\"\'\ \
    \'RM_WORK_EXCLUDE\ \+\=\ \" u-boot\"\'\ \
    \'RM_WORK_EXCLUDE\ \+\=\ \" arm-trusted-firmware\"\'\ \
    \'RM_WORK_EXCLUDE\ \+\=\ \" linux-renesas\"\'\ \
    \'RM_WORK_EXCLUDE\ \+\=\ \" linux-generic-armv8\"\'\ \
    \'RM_WORK_EXCLUDE\ \+\=\ \" core-image-weston\"\'\ \
    \'RM_WORK_EXCLUDE\ \+\=\ \" core-image-thin-initramfs\"\'\ \
    \'RM_WORK_EXCLUDE\ \+\=\ \" google-trout-agl-services-source\"\'\ \
    /g" build.ninja
