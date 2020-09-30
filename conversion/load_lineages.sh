#!/bin/sh


source ./config.sh

$OUT_DB_PSQL << _EOF_

drop table if exists parent_child;

create table parent_child
(
	parent_id text,
	child_id text
);

\echo ... loading ...

\copy parent_child(parent_id, child_id) from 'data/lineages.csv';

\echo ... creating primary key ...

alter table parent_child add primary key(parent_id, child_id);




_EOF_
