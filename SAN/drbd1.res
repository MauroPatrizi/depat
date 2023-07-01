resource iscsi0 {
	protocol C;
	volume 0 {
		device /dev/drbd0
		disk /dev/md0
		meta-disk internal;
	}


	on SAN1 {
		address 10.0.0.81:7788;
	}

	on SAN2 {
                address 10.0.0.82:7788;
        }
}
