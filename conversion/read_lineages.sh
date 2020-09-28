#!/bin/sh

psql -h sampgsdb03.fnal.gov -p 5435 -U samread sam_dune_prd \
	> ./data/lineages.csv \
	<< _EOF_
copy (	select distinct l.file_id_source, l.file_id_dest
		from file_lineages l, data_files f1, data_files f2
		where f1.file_id = l.file_id_source and f1.retired_date is null 
			and f2.file_id = l.file_id_dest and f2.retired_date is null
) to stdout



_EOF_
