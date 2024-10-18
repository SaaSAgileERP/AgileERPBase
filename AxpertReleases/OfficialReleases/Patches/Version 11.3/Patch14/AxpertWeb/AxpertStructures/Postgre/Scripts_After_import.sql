-------------Postgres

<<
create table bk19924_ax_layoutdesign_saved as select * from ax_layoutdesign_saved; 

>>

<<

create table bk19924_ax_layoutdesign as select * from ax_layoutdesign;

>>

<<

CREATE OR REPLACE FUNCTION rel_tmp_axglo_design()
 RETURNS void
 LANGUAGE plpgsql
AS $function$
declare 
recexists numeric;
recexists1 numeric;

begin

select count(1) into recexists from ax_layoutdesign_saved where transid='axglo';
select count(1) into recexists1 from ax_layoutdesign where transid='axglo';


	if recexists = 0 then
		INSERT INTO ax_layoutdesign_saved (transid, "module", "content", created_by, updated_by, is_deleted, created_on, updated_on, is_migrated, is_publish, is_private, parent_design_id, responsibility, order_by) VALUES('axglo', 'TSTRUCT', '[{"transid":"axglo","compressedMode":true,"newDesign":true,"staticRunMode":false,"wizardDC":false,"selectedLayout":"default","selectedFontSize":"14","selectedControlHeight":"24","tstUpdatedOn":"09-09-2024 14:17:41","dcLayout":"single","formWidth":"100","formAlignment":null,"fieldCaptionWidth":"30","formLabel":[],"buttonFieldFont":[],"dcs":[{"dc_id":"1","isGrid":"F","gridStretch":false,"fieldsDesign":[{"fld_id":"AxGlo_Hide","x":0,"y":0,"width":15,"height":1,"visibility":true}],"tableDesign":[{"fld_id":"AxGlo_Hide","width":400,"visibility":true}]}],"newdcs":[{"dc_id":"1","isGrid":"F","gridStretch":false,"fieldsDesign":[{"fld_id":"AxGlo_Hide","x":0,"y":0,"width":36,"height":1,"visibility":true},{"fld_id":"fromuserlogin","x":0,"y":1,"width":36,"height":1,"visibility":true},{"fld_id":"axp_displaytext","x":0,"y":2,"width":36,"height":1,"visibility":true}],"tableDesign":null}]}]', 'admin', 'admin', 'N', now(), now(), 'N', 'Y', 'N', 66, NULL, NULL);
	else
		update ax_layoutdesign_saved set content='[{"transid":"axglo","compressedMode":true,"newDesign":true,"staticRunMode":false,"wizardDC":false,"selectedLayout":"default","selectedFontSize":"14","selectedControlHeight":"24","tstUpdatedOn":"09-09-2024 14:17:41","dcLayout":"single","formWidth":"100","formAlignment":null,"fieldCaptionWidth":"30","formLabel":[],"buttonFieldFont":[],"dcs":[{"dc_id":"1","isGrid":"F","gridStretch":false,"fieldsDesign":[{"fld_id":"AxGlo_Hide","x":0,"y":0,"width":15,"height":1,"visibility":true}],"tableDesign":[{"fld_id":"AxGlo_Hide","width":400,"visibility":true}]}],"newdcs":[{"dc_id":"1","isGrid":"F","gridStretch":false,"fieldsDesign":[{"fld_id":"AxGlo_Hide","x":0,"y":0,"width":36,"height":1,"visibility":true},{"fld_id":"fromuserlogin","x":0,"y":1,"width":36,"height":1,"visibility":true},{"fld_id":"axp_displaytext","x":0,"y":2,"width":36,"height":1,"visibility":true}],"tableDesign":null}]}]' where transid='axglo';	
	end if;



	if recexists1 = 0 then
		INSERT INTO ax_layoutdesign (transid, "module", "content", created_by, updated_by, is_deleted, is_private, created_on, updated_on, is_migrated) VALUES('axglo', 'TSTRUCT', '[{"transid":"axglo","compressedMode":true,"newDesign":true,"staticRunMode":false,"wizardDC":false,"selectedLayout":"default","selectedFontSize":"14","selectedControlHeight":"24","tstUpdatedOn":"09-09-2024 14:17:41","dcLayout":"single","formWidth":"100","formAlignment":null,"fieldCaptionWidth":"30","formLabel":[],"buttonFieldFont":[],"dcs":[{"dc_id":"1","isGrid":"F","gridStretch":false,"fieldsDesign":[{"fld_id":"AxGlo_Hide","x":0,"y":0,"width":15,"height":1,"visibility":true}],"tableDesign":[{"fld_id":"AxGlo_Hide","width":400,"visibility":true}]}],"newdcs":[{"dc_id":"1","isGrid":"F","gridStretch":false,"fieldsDesign":[{"fld_id":"AxGlo_Hide","x":0,"y":0,"width":36,"height":1,"visibility":true},{"fld_id":"fromuserlogin","x":0,"y":1,"width":36,"height":1,"visibility":true},{"fld_id":"axp_displaytext","x":0,"y":2,"width":36,"height":1,"visibility":true}],"tableDesign":null}]}]', 'admin', 'admin', 'N', 'N', now(), now(), 'N');
	else
		update ax_layoutdesign set content='[{"transid":"axglo","compressedMode":true,"newDesign":true,"staticRunMode":false,"wizardDC":false,"selectedLayout":"default","selectedFontSize":"14","selectedControlHeight":"24","tstUpdatedOn":"09-09-2024 14:17:41","dcLayout":"single","formWidth":"100","formAlignment":null,"fieldCaptionWidth":"30","formLabel":[],"buttonFieldFont":[],"dcs":[{"dc_id":"1","isGrid":"F","gridStretch":false,"fieldsDesign":[{"fld_id":"AxGlo_Hide","x":0,"y":0,"width":15,"height":1,"visibility":true}],"tableDesign":[{"fld_id":"AxGlo_Hide","width":400,"visibility":true}]}],"newdcs":[{"dc_id":"1","isGrid":"F","gridStretch":false,"fieldsDesign":[{"fld_id":"AxGlo_Hide","x":0,"y":0,"width":36,"height":1,"visibility":true},{"fld_id":"fromuserlogin","x":0,"y":1,"width":36,"height":1,"visibility":true},{"fld_id":"axp_displaytext","x":0,"y":2,"width":36,"height":1,"visibility":true}],"tableDesign":null}]}]' where transid='axglo';	
	end if;

end; 
$function$
;

>>

<<

SELECT rel_tmp_axglo_design();

>>


<<

drop function rel_tmp_axglo_design();

>>

<<

update axp_cards set inhomepage=case when cardtype='kpi' then 'T' else 'F' end

>>

<<

CREATE TABLE axpdef_axpanalytics_mdata (
	ftransid varchar(10) NULL,
	fcaption varchar(500) NULL,
	fldname varchar(50) NULL,
	fldcap varchar(500) NULL,
	cdatatype varchar(50) NULL,
	fdatatype varchar(50) NULL,
	fmodeofentry varchar(50) NULL,
	hide varchar(10) NULL,
	props varchar(4000) NULL,
	"normalized" varchar(10) NULL,
	srctable varchar(50) NULL,
	srcfield varchar(50) NULL,
	srctransid varchar(10) NULL,
	allowempty varchar(10) NULL,
	filtertype varchar(50) NULL,
	grpfield varchar(10) NULL,
	aggfield varchar(10) NULL,
	subentity varchar(1) NULL,
	datacnd numeric(1) NULL,
	entityrelfld varchar(100) NULL,
	allowduplicate varchar(1) NULL,
	tablename varchar(100) NULL,
	dcname varchar(10) NULL,
	fordno numeric NULL,
	dccaption varchar(100) NULL,
	griddc varchar(2) NULL,
	listingfld varchar(1) NULL
);
>>

<<

CREATE SEQUENCE ax_entity_relseq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 101
	CACHE 1
	NO CYCLE;
>>

-- DROP FUNCTION fn_axpanalytics_ap_charts(varchar, varchar, varchar, varchar, varchar);

<<

CREATE OR REPLACE FUNCTION fn_axpanalytics_ap_charts(pentity_transid character varying, pcriteria character varying, pfilter character varying, pusername character varying DEFAULT 'admin'::character varying, papplydac character varying DEFAULT 'T'::character varying)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
DECLARE
rec record;
rec_filters record;
v_primarydctable varchar;
v_subentitytable varchar;
v_transid varchar;
v_grpfld varchar;
v_aggfld varchar;
v_aggfnc varchar;
v_srckey varchar;
v_srctbl varchar;
v_srcfld varchar;
v_aempty varchar;
v_aggfldtable varchar;
v_sql text;
v_normalizedjoin varchar;
v_keyname varchar;
v_entitycond varchar;
v_keyfld_fname varchar;
v_keyfld_fval varchar;
v_final_sqls text[] DEFAULT  ARRAY[]::text[];
v_fldname_transidcnd numeric;
v_sql1 text;
v_filter_srcfld varchar;
v_filter_srctxt varchar;
v_filter_join varchar;
v_filter_joinsary varchar[] DEFAULT  ARRAY[]::varchar[];
v_filter_cnd varchar;
v_filter_cndary varchar[] DEFAULT  ARRAY[]::varchar[];
v_filter_joinreq numeric;
v_filter_dcjoinsary varchar[] DEFAULT  ARRAY[]::varchar[];
v_filter_col varchar;
v_filter_normalized varchar;
v_filter_sourcetbl varchar;
v_filter_sourcefld varchar;
v_filter_datatype varchar;
v_filter_listedfld varchar;
v_filter_tablename varchar;
v_emptyary varchar[] DEFAULT  ARRAY[]::varchar[];
v_dacenabled numeric;
v_grpfld_tbl varchar;
v_grpfld_tablejoins varchar;
v_aggfld_tablejoins varchar;
v_tablejoins varchar;
v_aggfldtransid varchar;
v_aggfld_primarydctable varchar;
v_entityrelation varchar;
v_aggfldname_transidcnd numeric;
v_entity_parent_reltable varchar;
v_entity_child_reltable varchar;
begin

	/*	 
	 * pcriteria_v1 - transid~aggfnc~groupfld~normalized~srctable~srcfld~allowempty~grpfld_tablename~aggfld~aggfld_tablename(Not in use)	 
	 * pcriteria_v2 - aggfnc~grpfld_transid~groupfld~normalized~srctable~srcfld~allowempty~grpfld_tablename~aggfld_transid~aggfld~aggfld_tablename~grpfld_transid_AND_aggfld_transid_relation
	 * Ex1(agg fld in Non grid dc) - sum~gcust~party_name~F~~~~mg_partyhdr~slord~total_discount~salesorder_header~mg_partyhdr.mg_partyhdrid = salesorder_header.customer
	 * Ex2(agg fld in grid dc) - sum~gcust~party_name~F~~~~mg_partyhdr~slord~taxableamount~salesorder_items~mg_partyhdr.mg_partyhdrid = salesorder_header.customer

	*/ 	 
	
	
	select lower(trim(tablename)) into v_primarydctable from axpdc where tstruct = pentity_transid and dname ='dc1';
	
	select count(1) into v_fldname_transidcnd from axpflds where tstruct = pentity_transid and lower(tablename)=lower(v_primarydctable) and lower(fname)='transid';

	select count(1) into v_dacenabled from axpdef_user_logins where user_name = pusername and 'T' = papplydac;
	
	
	
	    FOR rec IN
    	    select unnest(string_to_array(pcriteria,'^')) criteria 
    	    -----aggfnc~grpfld_transid~groupfld~normalized~srctable~srcfld~allowempty~grpfld_tablename~aggfld_transid~aggfld~aggfld_tablename~grpfld_transid_AND_aggfld_transid_relation
		    loop
			    	
			    v_aggfnc := split_part(rec.criteria,'~',1);---- agg function
			    v_transid := split_part(rec.criteria,'~',2);---grpfld_transid  			    
		    	v_grpfld := split_part(rec.criteria,'~',3);---grpfld_name
			    v_srckey := split_part(rec.criteria,'~',4);---normalized_grpfld_flag
	   			v_srctbl := split_part(rec.criteria,'~',5);---normalied_source table	   			
		   		v_srcfld := split_part(rec.criteria,'~',6);---normalied_source field
			   	v_aempty := split_part(rec.criteria,'~',7);---grpfld_allowempty - to franme left join or join
			    v_grpfld_tbl := lower(trim(split_part(rec.criteria,'~',8)));--grpfld_tablename
			    v_aggfldtransid :=split_part(rec.criteria,'~',9);--aggfld_transid;
				v_aggfld := case when split_part(rec.criteria,'~',10)='count' then '1' else split_part(rec.criteria,'~',10) end;				
				v_aggfldtable := lower(trim(split_part(rec.criteria,'~',11)));---aggfld_tablename
				v_entityrelation := split_part(rec.criteria,'~',12);---grpfld_transid_aggfld_transid_relation
				v_entity_parent_reltable := lower(trim(split_part(split_part(v_entityrelation,'=',1),'.',1)));
				v_entity_child_reltable := lower(trim(split_part(split_part(v_entityrelation,'=',2),'.',1)));
				
				
				v_normalizedjoin := case when v_srckey='T' then concat(' left join ',v_srctbl,' b on ',v_grpfld_tbl,'.',v_grpfld,' = b.',v_srctbl,'id ') else ' ' end;
				v_keyname := case when length(v_grpfld) > 0 then case when v_srckey='T' then concat('b.',v_srcfld) else concat(v_grpfld_tbl,'.',v_grpfld) end else 'null' end;			
			
			
			if v_transid = v_aggfldtransid then
			
				if lower(v_aggfldtable)=lower(v_primarydctable) and lower(v_grpfld_tbl)=lower(v_primarydctable) then
					v_tablejoins := v_primarydctable;								   			   									
				elsif lower(v_grpfld_tbl) != lower(v_primarydctable) and lower(v_aggfldtable)=lower(v_primarydctable) then
					v_tablejoins := v_primarydctable||' left join '||v_grpfld_tbl||' on '||v_grpfld_tbl||'.'||v_primarydctable||'id='||v_primarydctable||'.'||v_primarydctable||'id';
				elsif lower(v_aggfldtable) != lower(v_primarydctable) and lower(v_grpfld_tbl)=lower(v_primarydctable) then
					v_tablejoins := v_primarydctable||' left join '||v_aggfldtable||' on '||v_aggfldtable||'.'||v_primarydctable||'id='||v_primarydctable||'.'||v_primarydctable||'id';
				elsif lower(v_aggfldtable) != lower(v_primarydctable) and lower(v_grpfld_tbl)=lower(v_aggfldtable) then
					v_tablejoins := v_primarydctable||' left join '||v_aggfldtable||' on '||v_aggfldtable||'.'||v_primarydctable||'id='||v_primarydctable||'.'||v_primarydctable||'id';
				elsif lower(v_aggfldtable) != lower(v_primarydctable) and lower(v_grpfld_tbl)!=lower(v_aggfldtable) then
					v_tablejoins := v_primarydctable||' left join '||v_aggfldtable||' on '||v_aggfldtable||'.'||v_primarydctable||'id='||v_primarydctable||'.'||v_primarydctable||'id left join '||v_grpfld_tbl||' on '||v_grpfld_tbl||'.'||v_primarydctable||'id='||v_primarydctable||'.'||v_primarydctable||'id';
				end if;	----------------- v_tablejoins																						
			
			elsif v_transid != v_aggfldtransid then
				select lower(trim(tablename)) into v_aggfld_primarydctable from axpdc where tstruct = v_aggfldtransid and dname ='dc1';	
			
				select count(1) into v_aggfldname_transidcnd from axpflds where tstruct = v_aggfldtransid and lower(tablename) = lower(v_aggfld_primarydctable) 
				and lower(fname)='transid';

				------------group field joins
				if lower(v_grpfld_tbl)=lower(v_primarydctable)  and lower(v_entity_parent_reltable)=lower(v_primarydctable) then 
					v_grpfld_tablejoins := v_grpfld_tbl;
				elsif lower(v_grpfld_tbl)!=lower(v_primarydctable) and lower(v_entity_parent_reltable)=lower(v_primarydctable) then 
					v_grpfld_tablejoins := v_primarydctable||' join '||v_grpfld_tbl||' on '||v_grpfld_tbl||'.'||v_primarydctable||'id='||v_primarydctable||'.'||v_primarydctable||'id';
				elsif lower(v_grpfld_tbl)=lower(v_primarydctable) and lower(v_entity_parent_reltable)!=lower(v_primarydctable) then 
					v_grpfld_tablejoins := v_primarydctable||' join '||v_entity_parent_reltable||' on '||v_entity_parent_reltable||'.'||v_primarydctable||'id='||v_primarydctable||'.'||v_primarydctable||'id';	
				elsif lower(v_grpfld_tbl)!=lower(v_primarydctable) and lower(v_entity_parent_reltable)!=lower(v_primarydctable) then
					v_grpfld_tablejoins := v_primarydctable||' join '||v_grpfld_tbl||' on '||v_grpfld_tbl||'.'||v_primarydctable||'id='||v_primarydctable||'.'||v_primarydctable||'id'
									||' join '||v_entity_parent_reltable||' on '||v_entity_parent_reltable||'.'||v_primarydctable||'id='||v_primarydctable||'.'||v_primarydctable||'id';
				end if;								
					
				--------------agg field joins	
				if lower(v_aggfldtable)=lower(v_aggfld_primarydctable)  and lower(v_entity_child_reltable)=lower(v_aggfld_primarydctable) then 
					v_aggfld_tablejoins := ' join '||v_aggfldtable||' on '||v_entityrelation;
				elsif lower(v_aggfldtable)!=lower(v_aggfld_primarydctable) and lower(v_entity_child_reltable)=lower(v_aggfld_primarydctable) then 
					v_aggfld_tablejoins := ' join '||v_entity_child_reltable||' on '||v_entityrelation||' join '||v_aggfldtable||' on '||v_aggfldtable||'.'||v_aggfld_primarydctable||'id='||v_aggfld_primarydctable||'.'||v_aggfld_primarydctable||'id';
				elsif lower(v_aggfldtable)=lower(v_aggfld_primarydctable) and lower(v_entity_child_reltable)!=lower(v_aggfld_primarydctable) then 
					v_aggfld_tablejoins := ' join '||v_entity_child_reltable||' on '||v_entityrelation||' join '||v_aggfld_primarydctable||' on '||v_aggfld_primarydctable||'.'||v_aggfld_primarydctable||'id='||v_entity_child_reltable||'.'||v_aggfld_primarydctable||'id';	
				elsif lower(v_aggfldtable)!=lower(v_aggfld_primarydctable) and lower(v_entity_child_reltable)!=lower(v_aggfld_primarydctable) then
					v_aggfld_tablejoins := ' join '||v_entity_child_reltable||' on '||v_entityrelation||' join '||v_aggfld_primarydctable||' on '||v_aggfld_primarydctable||'.'||v_aggfld_primarydctable||'id='||v_entity_child_reltable||'.'||v_aggfld_primarydctable||'id'||
											' join '||v_aggfldtable||' on '||v_aggfldtable||'.'||v_aggfld_primarydctable||'id='||v_aggfld_primarydctable||'.'||v_aggfld_primarydctable||'id';									
				end if;											
				
				v_tablejoins := concat(v_grpfld_tablejoins,' ',v_aggfld_tablejoins);
			
			end if; ------- v_transid = v_aggfldtransid
				
			
			
			select concat('select ',v_keyname,' keyname,',case when lower(trim(v_aggfnc)) in ('sum','avg') then 'round('||v_aggfnc||'('||v_aggfld||'),2)'else v_aggfnc||'('||v_aggfld||')' end,
			'keyvalue,','''',rec.criteria,'''::varchar',' criteria from ',v_tablejoins,' ',v_normalizedjoin)
			into v_sql;
																								
			
				if v_dacenabled > 0 then
					v_sql := v_sql||' join vw_dac_associate_users on vw_dac_associate_users.associateuser='||
							 v_primarydctable||'.createdby and vw_dac_associate_users.primaryuser='||''''||pusername||'''';
				
				end if;
				
			
			
				if coalesce(pfilter,'NA') ='NA' then 
				
				
			v_sql1 := concat(v_sql,' where ',v_primarydctable,'.cancel=''F''',
						case when v_fldname_transidcnd > 0 then concat(' and ',v_primarydctable,'.transid=''',pentity_transid,'''') end,
						case when v_transid != v_aggfldtransid then ' and '||v_aggfld_primarydctable||'.cancel=''F''' end,
						case when v_aggfldname_transidcnd > 0 then concat(' and ',v_aggfld_primarydctable,'.transid=''',v_aggfldtransid,'''') end,
						case when length(v_grpfld) > 0 then concat(' group by ',v_keyname) else '' end);
	
		else 
			FOR rec_filters IN
    			select unnest(string_to_array(pfilter,'^')) ifilter
			    loop		    	
			    	v_filter_srcfld := split_part(rec_filters.ifilter,'|',1);
			    	v_filter_srctxt := split_part(rec_filters.ifilter,'|',2);
			    	v_filter_col := split_part(v_filter_srcfld,'~',1);
				    v_filter_normalized := split_part(v_filter_srcfld,'~',2);
 				    v_filter_sourcetbl := split_part(v_filter_srcfld,'~',3);
 				    v_filter_sourcefld := split_part(v_filter_srcfld,'~',4);
					v_filter_datatype := split_part(v_filter_srcfld,'~',5);
					v_filter_listedfld :=split_part(v_filter_srcfld,'~',6);
					v_filter_tablename:=split_part(v_filter_srcfld,'~',7);
					
		
			    				    	
			    	if  v_filter_listedfld = 'F' then
			    	
					v_filter_joinreq := case when lower(v_aggfldtable)=lower(v_filter_tablename) then 1 else 0 end; 			    		
					
			    	if v_filter_joinreq = 0  then 
				    	v_filter_dcjoinsary := array_append(v_filter_dcjoinsary,concat(' join ',v_filter_tablename,' on ',v_primarydctable,'.',v_primarydctable,'id=',v_filter_tablename,'.',v_primarydctable,'id') );
			    	end if;
			    
			    	
			    
		    		select case when v_filter_normalized='T' 
					then concat(' join ',v_filter_sourcetbl,' ',v_filter_col,' on ',v_filter_tablename,'.',v_filter_col,' = ',v_filter_col,'.',v_filter_sourcetbl,'id')
					end into v_filter_join from dual where v_filter_normalized='T';
					
					 
					v_filter_joinsary :=array_append(v_filter_joinsary,v_filter_join);				
					
				
					end if;
			
									
					select case when v_filter_normalized='F' 
					then concat(case when v_filter_datatype='c' then 'lower(' end,v_filter_tablename,'.',v_filter_col,case when v_filter_datatype='c' then ')' end,' ',v_filter_srctxt) 
					else concat(case when v_filter_datatype='c' then 'lower(' end,v_filter_col,'.',v_filter_sourcefld,case when v_filter_datatype='c' then ')' end,' ',v_filter_srctxt) 
					end into v_filter_cnd;
		    	
					v_filter_cndary := array_append(v_filter_cndary,v_filter_cnd);				
			
									
			    end loop;
			   
			   	v_filter_dcjoinsary := ARRAY(SELECT DISTINCT UNNEST(v_filter_dcjoinsary));			
			   
				v_sql1 := concat(v_sql,array_to_string(v_filter_dcjoinsary,' '),array_to_string(v_filter_joinsary,' '),
						' where ',v_primarydctable,'.cancel=''F''',
						case when v_fldname_transidcnd > 0 then concat(' and ',v_primarydctable,'.transid=''',pentity_transid,''' and ') end,
						case when v_transid != v_aggfldtransid then v_aggfld_primarydctable||'.cancel=''F''' end,
						case when v_aggfldname_transidcnd > 0 then concat(' and ',v_aggfld_primarydctable,'.transid=''',v_aggfldtransid,'''') end,						
						array_to_string(v_filter_cndary,' and '),
						case when length(v_grpfld) > 0 then concat(' group by ',v_keyname) else '' end);					    						
		end if;

			v_final_sqls := array_append(v_final_sqls,v_sql1);
			v_filter_cndary:= v_emptyary;
	    	END LOOP;
	      	

   return array_to_string(v_final_sqls,'^^^') ;
END;
$function$
;

>>


-- DROP FUNCTION fn_axpanalytics_chartdata(varchar, varchar, varchar, varchar, varchar, varchar, varchar);

<<

CREATE OR REPLACE FUNCTION fn_axpanalytics_chartdata(psource character varying, pentity_transid character varying, pcondition character varying, pcriteria character varying, pfilter character varying DEFAULT 'NA'::character varying, pusername character varying DEFAULT 'admin'::character varying, papplydac character varying DEFAULT 'T'::character varying)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
DECLARE
rec record;
rec_filters record;
dacrec record;
v_primarydctable varchar;
v_subentitytable varchar;
v_transid varchar;
v_grpfld varchar;
v_aggfld varchar;
v_aggfnc varchar;
v_srckey varchar;
v_srctbl varchar;
v_srcfld varchar;
v_aempty varchar;
v_tablename varchar;
v_sql text;
v_normalizedjoin varchar;
v_keyname varchar;
v_entitycond varchar;
v_keyfld_fname varchar;
v_keyfld_fval varchar;
v_final_sqls text[] DEFAULT  ARRAY[]::text[];
v_fldname_transidcnd numeric;
v_sql1 text;
v_jointables varchar[] DEFAULT  ARRAY[]::varchar[];
v_filter_srcfld varchar;
v_filter_srctxt varchar;
v_filter_join varchar;
v_filter_joinsary varchar[] DEFAULT  ARRAY[]::varchar[];
v_filter_cnd varchar;
v_filter_cndary varchar[] DEFAULT  ARRAY[]::varchar[];
v_filter_joinreq numeric;
v_filter_dcjoinsary varchar[] DEFAULT  ARRAY[]::varchar[];
v_filter_col varchar;
v_filter_normalized varchar;
v_filter_sourcetbl varchar;
v_filter_sourcefld varchar;
v_filter_datatype varchar;
v_filter_listedfld varchar;
v_filter_tablename varchar;
v_emptyary varchar[] DEFAULT  ARRAY[]::varchar[];
v_dacenabled numeric;
v_dactype numeric;
v_dac_join varchar;
v_dac_joinsary varchar[] DEFAULT  ARRAY[]::varchar[];
v_dac_cnd varchar;
v_dac_cndary varchar[] DEFAULT  ARRAY[]::varchar[];
v_dac_joinreq numeric;
v_dac_normalizedjoinreq numeric; 

begin

	/*
	 * psource - Entity / Subentity	
	 * pcriteria - transid~groupfld~aggfld~aggfnc~normalized~srctable~srcfld~allowempty~tablename~keyfld~keyval
	 * 
	 * pfilter 
	 * search field|operator search text^
	 * fldname~normalized~sourcetable~sourcefld~datatype~listedfield~tablename| operator search text^
	*/ 	 
	
	
	select tablename into v_primarydctable from axpdc where tstruct = pentity_transid and dname ='dc1';	

	v_jointables := array_append(v_jointables,v_primarydctable);

----DAC V5
	select sum(cnt),sum(appl) into v_dacenabled,v_dactype from
	(select count(*) cnt,2 appl from axpdef_dac_config a  
	where a.uname = pusername and a.stransid = pentity_transid and a.editmode='View'
	having count(*) > 0
	union all
	select count(*),1 appl from axpdef_dac_config a  join axuserlevelgroups a2 on a.urole = a2.usergroup 
	where a2.username = pusername and a.stransid = pentity_transid and a.editmode='View'
	and ((a2.startdate is not null and current_date  >= startdate) or (startdate is null)) and ((enddate is not null and current_date  <= enddate) or (enddate is null))
	having count(*) > 0
	)a
	where 'T' = papplydac;

	
	if pcondition ='Custom' then
	
		select count(1) into v_fldname_transidcnd from axpflds where tstruct = pentity_transid and dcname ='dc1' and lower(fname)='transid';
	
	    FOR rec IN
    	    select unnest(string_to_array(pcriteria,'^')) criteria 
		    loop		    			    
			    v_transid := split_part(rec.criteria,'~',1);
		    	v_grpfld := split_part(rec.criteria,'~',2);
				v_aggfld := case when split_part(rec.criteria,'~',3)='count' then '1' else split_part(rec.criteria,'~',3) end;
				v_aggfnc := split_part(rec.criteria,'~',4);
				v_srckey := split_part(rec.criteria,'~',5);
				v_srctbl := split_part(rec.criteria,'~',6);
				v_srcfld := split_part(rec.criteria,'~',7);
				v_aempty := split_part(rec.criteria,'~',8);
				v_tablename := split_part(rec.criteria,'~',9);
				v_keyfld_fname := split_part(rec.criteria,'~',10);
				v_keyfld_fval := split_part(rec.criteria,'~',11);
				
				v_jointables := case when v_srckey='T' then array_append(v_jointables,v_srctbl) end;
				v_normalizedjoin := case when v_srckey='T' then concat(' left join ',v_srctbl,' b on ',v_primarydctable,'.',v_grpfld,' = b.',v_srctbl,'id ') else ' ' end;
				v_keyname := case when length(v_grpfld) > 0 then case when v_srckey='T' then concat('b.',v_srcfld) else concat(v_primarydctable,'.',v_grpfld) end else 'null' end;			
											
				
					if lower(v_tablename)=lower(v_primarydctable) then
						select concat('select ',v_keyname,' keyname,',case when lower(trim(v_aggfnc)) in ('sum','avg') then 'round('||v_aggfnc||'('||v_aggfld||'),2)'else v_aggfnc||'('||v_aggfld||')' end,
						'keyvalue,''Custom''::varchar cnd,','''',rec.criteria,'''::varchar',' criteria from ',v_tablename,' ',v_normalizedjoin)
						into v_sql;
						v_jointables := array_append(v_jointables,v_tablename);		   			   									
					else
						select concat('select ',
						concat(' ',v_keyname,' keyname,',case when lower(trim(v_aggfnc)) in ('sum','avg') then 'round('||v_aggfnc||'('||v_aggfld||'),2)'else v_aggfnc||'('||v_aggfld||')' end,
						' keyvalue,''Custom''::varchar cnd,','''',rec.criteria,'''::varchar',' criteria from ',
						concat(v_primarydctable,'  join ',v_tablename,' on ',v_primarydctable,'.',v_primarydctable,'id=',v_tablename,'.',v_primarydctable,'id '),
						v_normalizedjoin))a
						into v_sql;
						v_jointables := array_append(v_jointables,v_tablename);
						
					end if;																											
			
			
			---------------DAC V5
			if v_dacenabled > 0 then	
			   for dacrec in 			   
					select fname,tablename,srckey,srctf,srcfld,
					case when filtercnd in('like','not like') then case when isglovar='F' then '''%'||attribvalue||'%''' else 
					case when lower(trim(attribvalue))=':username' then  '''%'||pusername||'%''' else '''%''||'||attribvalue||'||''%''' end end
					when filtercnd in('in','not in') then case when isglovar='F' then ''''||replace(attribvalue,',',''',''')||'''' else case when lower(trim(attribvalue))=':username' then  ''''||pusername||'''' else attribvalue end end
					when filtercnd in('=','!=','>','<') then case when isglovar='F' then ''''||attribvalue||'''' else case when lower(trim(attribvalue))=':username' then  ''''||pusername||'''' else attribvalue end end  end cnd,
					ord,filtercnd  from
					(
					select case when b.dynamicval ='No' and a.dataaccesscnd = 30 then b.fldstaticval when b.dynamicval ='Yes' and a.dataaccesscnd = 30 then b.fldmastvalue end  attribvalue,
					f.fname,f.tablename,1 ord, b.filtercnd,b.isglovar,f.srckey,f.srctf,f.srcfld
					from axpdef_dac_config a join axpdef_dac_configdtl b on a.axpdef_dac_configid =  b.axpdef_dac_configid
					join axpflds f on a.stransid =f.tstruct and b.fldname = f.fname 
					where a.uname = pusername  and a.stransid = pentity_transid and a.editmode='View'
					and a.dataaccesscnd = 30 and v_dactype in(2,3)
					union all			
					select case when b.dynamicval ='No' and a.dataaccesscnd = 30 then b.fldstaticval when b.dynamicval ='Yes' and a.dataaccesscnd = 30 then b.fldmastvalue end  attribvalue,
					b.fldname ,d.tablename,1 ord, b.filtercnd,b.isglovar,'F',null,null
					from axpdef_dac_config a join axpdef_dac_configdtl b on a.axpdef_dac_configid =  b.axpdef_dac_configid
					join axpdc d on a.stransid =d.tstruct and d.dname= 'dc1' 
					where a.uname = pusername  and a.stransid = pentity_transid and a.editmode='View'
					and a.dataaccesscnd = 30 and b.fldname in('createdby','username')  and v_dactype in(2,3)					
					union all					
					select  pusername attribvalue, 'createdby' ,d.tablename,1 ord,'='filtercnd,'F','F' srckey,null srctf, null srcfld
					from axpdef_dac_config a 
					join axpdc d on a.stransid =d.tstruct and d.dname= 'dc1' 
					where a.uname = pusername and a.dataaccesscnd in (10,11) and a.stransid = pentity_transid and a.editmode='View' and v_dactype in(2,3)					
					union all					
					select case when b.dynamicval ='No' and a.dataaccesscnd = 30 then b.fldstaticval when b.dynamicval ='Yes' and a.dataaccesscnd = 30 then b.fldmastvalue end  attribvalue,
					f.fname,f.tablename,2 ord, b.filtercnd,b.isglovar,f.srckey,f.srctf,f.srcfld
					from axpdef_dac_config a join axpdef_dac_configdtl b on a.axpdef_dac_configid =  b.axpdef_dac_configid
					join axpflds f on a.stransid =f.tstruct and b.fldname = f.fname 
					join axuserlevelgroups u on a.urole = u.usergroup and ((u.startdate is not null and current_date  >= startdate) or (startdate is null)) and ((enddate is not null and current_date  <= enddate) or (enddate is null))
					and u.username = pusername and a.stransid = pentity_transid and a.editmode='View'
					where a.dataaccesscnd =30 and v_dactype = 1			
					union all
					select case when b.dynamicval ='No' and a.dataaccesscnd = 30 then b.fldstaticval when b.dynamicval ='Yes' and a.dataaccesscnd = 30 then b.fldmastvalue end  attribvalue,
					b.fldname,d.tablename,2 ord, b.filtercnd,b.isglovar,'F',null,null
					from axpdef_dac_config a join axpdef_dac_configdtl b on a.axpdef_dac_configid =  b.axpdef_dac_configid
					join axpdc d on a.stransid =d.tstruct and d.dname= 'dc1'
					join axuserlevelgroups u on a.urole = u.usergroup and ((u.startdate is not null and current_date  >= startdate) or (startdate is null)) and ((enddate is not null and current_date  <= enddate) or (enddate is null))
					and u.username = pusername and a.stransid = pentity_transid and a.editmode='View'
					where a.dataaccesscnd =30 and v_dactype = 1	and  b.fldname in('createdby','username') 				
					union all
					select  pusername attribvalue, 'createdby' ,d.tablename,2 ord,'='filtercnd ,'F','F' srckey,null srctf, null srcfld
					from axpdef_dac_config a 
					join axpdc d on a.stransid =d.tstruct and d.dname= 'dc1'
					join axuserlevelgroups u on a.urole = u.usergroup and ((u.startdate is not null and current_date  >= startdate) or (startdate is null)) and ((enddate is not null and current_date  <= enddate) or (enddate is null))
					and u.username = pusername and a.stransid = pentity_transid and a.editmode='View'
					where a.dataaccesscnd in (10,11) and v_dactype = 1
					)a
					order by ord 
					
					loop
						
						select count(1) into v_dac_joinreq from (select distinct unnest(v_jointables)tbls)a 
						where trim(lower(a.tbls))=trim(lower(dacrec.tablename));
						
							

						if dacrec.srckey='T' then
						select count(1) into v_dac_normalizedjoinreq from (select distinct unnest(v_jointables)tbls)a 
						where lower(a.tbls)=lower(dacrec.srctf);
						end if;

						if v_dac_normalizedjoinreq = 0 then
						v_dac_joinsary := array_append(v_dac_joinsary,concat(' join ',dacrec.srctf,' on ',dacrec.srctf,'.',dacrec.srctf,'id=',dacrec.tablename,'.',dacrec.fname));
						v_jointables := array_append(v_jointables,dacrec.srctf);						
						end if;
	
							
						if v_dac_joinreq = 0 then
						v_dac_joinsary := array_append(v_dac_joinsary,concat(' join3 ',dacrec.tablename,' on ',v_primarydctable,'.',v_primarydctable,'id=',dacrec.tablename,'.',v_primarydctable,'id') );
						v_jointables := array_append(v_jointables,dacrec.tablename);		
						end if;							
						
						
						v_dac_cnd := case 
									 when dacrec.srckey='F' then  concat(dacrec.tablename,'.',dacrec.fname,' ',dacrec.filtercnd,'(',case when dacrec.filtercnd in('in','not in') then 'select unnest(string_to_array('||dacrec.cnd||','',''))' else dacrec.cnd	end		,')')  
									 when 	dacrec.srckey='T' then  concat(dacrec.srctf,'.',dacrec.srcfld,' ',dacrec.filtercnd,'(',case when dacrec.filtercnd in('in','not in') then 'select unnest(string_to_array('||dacrec.cnd||','',''))' else dacrec.cnd	end		,')') 
									 end;
					
					
						v_dac_cndary := array_append(v_dac_cndary,v_dac_cnd);			
												
					
					end loop;								   					   			   							
				
			   end if;
			
				if coalesce(pfilter,'NA') ='NA' then 

			v_sql1 := concat(v_sql,' ',array_to_string(v_dac_joinsary,' '),' where ',v_primarydctable,'.cancel=''F''',
						case when v_fldname_transidcnd > 0 then concat(' and ',v_primarydctable,'.transid=''',pentity_transid,'''') end,
						case when v_dacenabled > 0 then concat(' and ',array_to_string(v_dac_cndary,' and ')) end,'
						--axp_filter
						',
						case when length(v_grpfld) > 0 then concat(' group by ',v_keyname) else '' end);
	
		else 
			FOR rec_filters IN
    			select unnest(string_to_array(pfilter,'^')) ifilter
			    loop		    	
			    	v_filter_srcfld := split_part(rec_filters.ifilter,'|',1);
			    	v_filter_srctxt := split_part(rec_filters.ifilter,'|',2);
			    	v_filter_col := split_part(v_filter_srcfld,'~',1);
				    v_filter_normalized := split_part(v_filter_srcfld,'~',2);
 				    v_filter_sourcetbl := split_part(v_filter_srcfld,'~',3);
 				    v_filter_sourcefld := split_part(v_filter_srcfld,'~',4);
					v_filter_datatype := split_part(v_filter_srcfld,'~',5);
					v_filter_listedfld :=split_part(v_filter_srcfld,'~',6);
					v_filter_tablename:=split_part(v_filter_srcfld,'~',7);
					
		
			    				    	
			    	if  v_filter_listedfld = 'F' then
			    	
					v_filter_joinreq := case when lower(v_tablename)=lower(v_filter_tablename) then 1 else 0 end; 			    		
					
			    	if v_filter_joinreq = 0  then 
				    	v_filter_dcjoinsary := array_append(v_filter_dcjoinsary,concat(' join ',v_filter_tablename,' on ',v_primarydctable,'.',v_primarydctable,'id=',v_filter_tablename,'.',v_primarydctable,'id') );
			    	end if;
			    
			    	
			    
		    		select case when v_filter_normalized='T' 
					then concat(' join ',v_filter_sourcetbl,' ',v_filter_col,' on ',v_filter_tablename,'.',v_filter_col,' = ',v_filter_col,'.',v_filter_sourcetbl,'id')
					end into v_filter_join from dual where v_filter_normalized='T';
					
					 
					v_filter_joinsary :=array_append(v_filter_joinsary,v_filter_join);				
					
				
					end if;
			
									
					select case when v_filter_normalized='F' 
					then concat(case when v_filter_datatype='c' then 'lower(' end,v_filter_tablename,'.',v_filter_col,case when v_filter_datatype='c' then ')' end,' ',v_filter_srctxt) 
					else concat(case when v_filter_datatype='c' then 'lower(' end,v_filter_col,'.',v_filter_sourcefld,case when v_filter_datatype='c' then ')' end,' ',v_filter_srctxt) 
					end into v_filter_cnd;
		    	
					v_filter_cndary := array_append(v_filter_cndary,v_filter_cnd);				
			
									
			    end loop;
			   
			   	v_filter_dcjoinsary := ARRAY(SELECT DISTINCT UNNEST(v_filter_dcjoinsary));				
				v_sql1 := concat(v_sql,array_to_string(v_filter_dcjoinsary,' '),array_to_string(v_filter_joinsary,' '),array_to_string(v_dac_joinsary,' '),'
						  where ',v_primarydctable,'.cancel=''F''',
						case when v_fldname_transidcnd > 0 then concat(' and ',v_primarydctable,'.transid=''',pentity_transid,''' and ') end,array_to_string(v_filter_cndary,' and '),
						case when v_dacenabled > 0 then concat(' and ',array_to_string(v_dac_cndary,' and ')) end,'
						--axp_filter
						',
						case when length(v_grpfld) > 0 then concat(' group by ',v_keyname) else '' end);					    						
		end if;

			v_final_sqls := array_append(v_final_sqls,v_sql1);
			v_filter_cndary:= v_emptyary;
			v_dac_cndary:= v_emptyary;
			v_dac_joinsary :=v_emptyary;
			v_jointables :=v_emptyary;
	    	END LOOP;
	   
   elsif pcondition = 'General' then 
		if psource ='Entity' then    
						
			select count(1) into v_fldname_transidcnd from axpflds where tstruct = pentity_transid and dcname ='dc1' and lower(fname)='transid';
			select concat('select count(*) totrec,
			sum(case when date_part(''year'' ,',v_primarydctable,'.createdon) = date_part(''year'',current_date) then 1 else 0 end) cyear,
			sum(case when date_part(''month'' ,',v_primarydctable,'.createdon) = date_part(''month'',current_date) then 1 else 0 end) cmonth,
			sum(case when date_part(''week'' ,',v_primarydctable,'.createdon) = date_part(''week'',current_date) then 1 else 0 end) cweek,
			sum(case when ',v_primarydctable,'.createdon::Date = current_date - 1 then 1 else 0 end) cyesterday,
			sum(case when ',v_primarydctable,'.createdon::Date = current_date then 1 else 0 end) ctoday,''General''::varchar cnd,null::varchar criteria
			from ',v_primarydctable) into v_sql;				
			
			--v_jointables := array_append(v_jointables,v_primarydctable);
			
		
				 
		if v_dacenabled > 0 then	
			    for dacrec in 			   
					select fname,tablename,srckey,srctf,srcfld,
					case when filtercnd in('like','not like') then case when isglovar='F' then '''%'||attribvalue||'%''' else 
					case when lower(trim(attribvalue))=':username' then  '''%'||pusername||'%''' else '''%''||'||attribvalue||'||''%''' end end
					when filtercnd in('in','not in') then case when isglovar='F' then ''''||replace(attribvalue,',',''',''')||'''' else case when lower(trim(attribvalue))=':username' then  ''''||pusername||'''' else attribvalue end end
					when filtercnd in('=','!=','>','<') then case when isglovar='F' then ''''||attribvalue||'''' else case when lower(trim(attribvalue))=':username' then  ''''||pusername||'''' else attribvalue end end  end cnd,
					ord,filtercnd  from
					(
					select case when b.dynamicval ='No' and a.dataaccesscnd = 30 then b.fldstaticval when b.dynamicval ='Yes' and a.dataaccesscnd = 30 then b.fldmastvalue end  attribvalue,
					f.fname,f.tablename,1 ord, b.filtercnd,b.isglovar,f.srckey,f.srctf,f.srcfld
					from axpdef_dac_config a join axpdef_dac_configdtl b on a.axpdef_dac_configid =  b.axpdef_dac_configid
					join axpflds f on a.stransid =f.tstruct and b.fldname = f.fname 
					where a.uname = pusername  and a.stransid = pentity_transid and a.editmode='View'
					and a.dataaccesscnd = 30 and v_dactype in(2,3)		
					union all
					select case when b.dynamicval ='No' and a.dataaccesscnd = 30 then b.fldstaticval when b.dynamicval ='Yes' and a.dataaccesscnd = 30 then b.fldmastvalue end  attribvalue,
					b.fldname,d.tablename,1 ord, b.filtercnd,b.isglovar,'F',null,null
					from axpdef_dac_config a join axpdef_dac_configdtl b on a.axpdef_dac_configid =  b.axpdef_dac_configid
					join axpdc d on a.stransid =d.tstruct and d.dname= 'dc1' 
					where a.uname = pusername  and a.stransid = pentity_transid and a.editmode='View'
					and a.dataaccesscnd = 30 and b.fldname in('createdby','username') and v_dactype in(2,3)		
					union all					
					select  pusername attribvalue, 'createdby' ,d.tablename,1 ord,'='filtercnd,'F','F' srckey,null srctf, null srcfld
					from axpdef_dac_config a 
					join axpdc d on a.stransid =d.tstruct and d.dname= 'dc1' 
					where a.uname = pusername and a.dataaccesscnd in (10,11) and a.stransid = pentity_transid and a.editmode='View' and v_dactype in(2,3)					
					union all					
					select case when b.dynamicval ='No' and a.dataaccesscnd = 30 then b.fldstaticval when b.dynamicval ='Yes' and a.dataaccesscnd = 30 then b.fldmastvalue end  attribvalue,
					f.fname,f.tablename,2 ord, b.filtercnd,b.isglovar,f.srckey,f.srctf,f.srcfld
					from axpdef_dac_config a join axpdef_dac_configdtl b on a.axpdef_dac_configid =  b.axpdef_dac_configid
					join axpflds f on a.stransid =f.tstruct and b.fldname = f.fname 
					join axuserlevelgroups u on a.urole = u.usergroup and ((u.startdate is not null and current_date  >= startdate) or (startdate is null)) and ((enddate is not null and current_date  <= enddate) or (enddate is null))
					and u.username = pusername and a.stransid = pentity_transid and a.editmode='View'
					where a.dataaccesscnd =30 and v_dactype = 1	
					union all
					select case when b.dynamicval ='No' and a.dataaccesscnd = 30 then b.fldstaticval when b.dynamicval ='Yes' and a.dataaccesscnd = 30 then b.fldmastvalue end  attribvalue,
					b.fldname,d.tablename,2 ord, b.filtercnd,b.isglovar,'F',null,null
					from axpdef_dac_config a join axpdef_dac_configdtl b on a.axpdef_dac_configid =  b.axpdef_dac_configid
					join axpdc d on a.stransid =d.tstruct and d.dname= 'dc1'
					join axuserlevelgroups u on a.urole = u.usergroup and ((u.startdate is not null and current_date  >= startdate) or (startdate is null)) and ((enddate is not null and current_date  <= enddate) or (enddate is null))
					and u.username = pusername and a.stransid = pentity_transid and a.editmode='View'
					where a.dataaccesscnd =30 and v_dactype = 1	and  b.fldname in('createdby','username') 						
					union all
					select  pusername attribvalue, 'createdby' ,d.tablename,2 ord,'='filtercnd ,'F','F' srckey,null srctf, null srcfld
					from axpdef_dac_config a 
					join axpdc d on a.stransid =d.tstruct and d.dname= 'dc1'
					join axuserlevelgroups u on a.urole = u.usergroup and ((u.startdate is not null and current_date  >= startdate) or (startdate is null)) and ((enddate is not null and current_date  <= enddate) or (enddate is null))
					and u.username = pusername and a.stransid = pentity_transid and a.editmode='View'
					where a.dataaccesscnd in (10,11) and v_dactype = 1
					)a
					order by ord 
					
					loop
						
						select count(1) into v_dac_joinreq from (select distinct unnest(v_jointables)tbls)a 
						where lower(a.tbls)=lower(dacrec.tablename);	

						if dacrec.srckey='T' then
						select count(1) into v_dac_normalizedjoinreq from (select distinct unnest(v_jointables)tbls)a 
						where lower(a.tbls)=lower(dacrec.srctf);
							if v_dac_normalizedjoinreq = 0 then
								v_dac_joinsary := array_append(v_dac_joinsary,concat(' join ',dacrec.srctf,' on ',dacrec.srctf,'.',dacrec.srctf,'id=',dacrec.tablename,'.',dacrec.fname));
								v_jointables := array_append(v_jointables,dacrec.srctf);						
							end if;					
						end if;

					
							
						if v_dac_joinreq = 0 then
						v_dac_joinsary := array_append(v_dac_joinsary,concat(' join ',dacrec.tablename,' on ',v_primarydctable,'.',v_primarydctable,'id=',dacrec.tablename,'.',v_primarydctable,'id') );
						v_jointables := array_append(v_jointables,dacrec.tablename);		
						end if;
												

						v_dac_cnd := case 
									 when dacrec.srckey='F' then  concat(dacrec.tablename,'.',dacrec.fname,' ',dacrec.filtercnd,'(',case when dacrec.filtercnd in('in','not in') then 'select unnest(string_to_array('||dacrec.cnd||','',''))' else dacrec.cnd	end		,')')  
									 when 	dacrec.srckey='T' then  concat(dacrec.srctf,'.',dacrec.srcfld,' ',dacrec.filtercnd,'(',case when dacrec.filtercnd in('in','not in') then 'select unnest(string_to_array('||dacrec.cnd||','',''))' else dacrec.cnd	end		,')') 
									 end;
					
					
						v_dac_cndary := array_append(v_dac_cndary,v_dac_cnd);															
					
					end loop;								   					   			   							
				
						v_sql := concat(v_sql,' ',array_to_string(v_dac_joinsary,' '),' where ',v_primarydctable,'.cancel=''F''',
								case when v_fldname_transidcnd > 0 then concat(' and ',v_primarydctable,'.transid=''',pentity_transid,'''') end,
								case when v_dacenabled > 0 then concat(' and ',array_to_string(v_dac_cndary,' and ')) end,
								'
								--axp_filter
								');			
				else 
						v_sql := concat(v_sql,' where cancel=''F''',
								case when v_fldname_transidcnd > 0 then concat(' and transid=''',pentity_transid,'''') end,
						' 
						--axp_filter');								
			   end if;
		
						
		v_final_sqls := array_append(v_final_sqls,v_sql);


			v_dac_cndary:= v_emptyary;
			v_dac_joinsary :=v_emptyary;
			--v_jointables :=v_emptyary;
		
				
		elsif psource= 'Subentity' then 		
		    FOR rec IN
	    	    select unnest(string_to_array(pcriteria,'^')) criteria
		    loop		    			    
	      		v_transid := split_part(rec.criteria,'~',1);
	      		v_tablename := split_part(rec.criteria,'~',9);
				v_keyfld_fname := split_part(rec.criteria,'~',10);
				v_keyfld_fval := split_part(rec.criteria,'~',11);

				select tablename into v_subentitytable from axpdc where tstruct = v_transid and dname ='dc1';				
			
				select count(1) into v_fldname_transidcnd from axpflds where tstruct = v_transid and dcname ='dc1' and lower(fname)='transid';
			
				if lower(v_tablename)=lower(v_subentitytable) then
			
				 v_sql := concat('select ','''',v_transid,'''transid',',count(*) totrec,''General''::varchar cnd,','''',replace(rec.criteria,'''',''),'''  criteria from ',v_tablename,' where cancel=''F'' and ',
				case when v_fldname_transidcnd > 0 then concat(' transid=''',v_transid,''' and ') end
				 ,v_keyfld_fname,'=',v_keyfld_fval);				
				
				else 
				
				v_sql := concat('select ','''',v_transid,'''transid',',count(*) totrec,''General''::varchar cnd,','''',replace(rec.criteria,'''',''),'''  criteria from ',v_tablename,' a join ',v_subentitytable,' b on a.',v_subentitytable,'id=b.',v_subentitytable,'id ',
				'where b.cancel=''F'' and ',
				case when v_fldname_transidcnd > 0 then concat(' b.transid=''',v_transid,''' and ') end
				 ,v_keyfld_fname,'=',v_keyfld_fval);
				
					
				end if;
			
				v_final_sqls := array_append(v_final_sqls,v_sql);			
			
			END LOOP;	
		
		end if;
	end if;

 
   return array_to_string(v_final_sqls,'^^^') ;
--return  dacrec.srctf;
--return cast(v_dac_normalizedjoinreq as text);
END;
$function$
;

>>

-- DROP FUNCTION fn_axpanalytics_edittxn(varchar, numeric, varchar, varchar);

<<

CREATE OR REPLACE FUNCTION fn_axpanalytics_edittxn(ptransid character varying, precordid numeric, pusername character varying DEFAULT 'admin'::character varying, papplydac character varying DEFAULT 'T'::character varying)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare 
rec record;
rec1 record;
rec2 record;
dacrec record;
v_sql text;
v_sql1 text;
v_primarydctable varchar;
v_fldnamesary varchar[] DEFAULT  ARRAY[]::varchar[];
v_fldname_joinsary varchar[] DEFAULT  ARRAY[]::varchar[];
v_fldname_col varchar;
v_fldname_normalized varchar;
v_fldname_srctbl varchar;
v_fldname_srcfld varchar;
v_fldname_allowempty varchar;
v_fldname_dcjoinsary varchar[] DEFAULT  ARRAY[]::varchar[];
v_fldname_dctablename varchar;
v_fldname_dcflds text;
v_fldname_dctables varchar[] DEFAULT  ARRAY[]::varchar[];
v_allflds varchar;
v_dacenabled numeric;
v_dactype numeric;
v_dac_cnd varchar;
v_dac_cndary varchar[] DEFAULT  ARRAY[]::varchar[];



begin


	select tablename into v_primarydctable from axpdc where tstruct = ptransid and dname ='dc1';


----DAC V5
	select sum(cnt),sum(appl) into v_dacenabled,v_dactype from
(select count(*) cnt,2 appl from axpdef_dac_config a  
where a.uname = pusername and a.stransid = ptransid and a.editmode='Edit'
having count(*) > 0
union all
select count(*),1 appl from axpdef_dac_config a  join axuserlevelgroups a2 on a.urole = a2.usergroup 
where a2.username = pusername and a.stransid = ptransid and a.editmode='Edit'
and ((a2.startdate is not null and current_date  >= startdate) or (startdate is null)) and ((enddate is not null and current_date  <= enddate) or (enddate is null))
having count(*) > 0
)a
where 'T' = papplydac;


			
			select string_agg(str,'^')  into v_allflds 
					from 
					(
					select concat(f.tablename,'=',string_agg(concat(f.fname,'~',f.srckey,'~',f.srctf,'~',f.srcfld,'~',f.allowempty),'|')) str
					from axpdef_dac_config a join axpdef_dac_configdtl b on a.axpdef_dac_configid =  b.axpdef_dac_configid
					join axpflds f on a.stransid =f.tstruct and b.fldname = f.fname 
					where a.uname = pusername  and a.stransid = ptransid and a.editmode='Edit'
					and a.dataaccesscnd = 30 and v_dactype in(2,3) 
					group by f.tablename									
					union all					
					select  tablename||'='||'createdby~F~~~F'
					from axpdef_dac_config a 
					join axpdc d on a.stransid =d.tstruct and d.dname= 'dc1' 
					where a.uname = pusername and a.dataaccesscnd in (10,11) 
					and a.stransid = ptransid and a.editmode='Edit' and v_dactype in(2,3)					
					union all					
					select concat(f.tablename,'=',string_agg(concat(f.fname,'~',f.srckey,'~',f.srctf,'~',f.srcfld,'~',f.allowempty),'|')) str
					from axpdef_dac_config a join axpdef_dac_configdtl b on a.axpdef_dac_configid =  b.axpdef_dac_configid
					join axpflds f on a.stransid =f.tstruct and b.fldname = f.fname 
					join axuserlevelgroups u on a.urole = u.usergroup and ((u.startdate is not null and current_date  >= startdate) or (startdate is null)) and ((enddate is not null and current_date  <= enddate) or (enddate is null))
					and u.username = pusername and a.stransid = ptransid and a.editmode='Edit'
					where a.dataaccesscnd =30 and v_dactype = 1					
					group by f.tablename	
					union all
					select tablename||'='||'createdby~F~~~F'
					from axpdef_dac_config a 
					join axpdc d on a.stransid =d.tstruct and d.dname= 'dc1'
					join axuserlevelgroups u on a.urole = u.usergroup and ((u.startdate is not null and current_date  >= startdate) or (startdate is null)) and ((enddate is not null and current_date  <= enddate) or (enddate is null))
					and u.username = pusername and a.stransid = ptransid and a.editmode='Edit'
					where a.dataaccesscnd in (10,11) and v_dactype = 1
					)a;			
		
						
		FOR rec1 IN
    		select unnest(string_to_array(v_allflds,'^')) dcdtls
    		loop	
    			v_fldname_dctablename := split_part(rec1.dcdtls,'=',1);
				v_fldname_dcflds := split_part(rec1.dcdtls,'=',2);
			
			if v_fldname_dctablename!=v_primarydctable then
						v_fldname_dcjoinsary := array_append(v_fldname_dcjoinsary,concat('left join ',v_fldname_dctablename,' on ',v_primarydctable,'.',v_primarydctable,'id=',v_fldname_dctablename,'.',v_primarydctable,'id') );						
					end if;
					v_fldname_dctables := array_append(v_fldname_dctables,v_fldname_dctablename);

				FOR rec2 IN
	    		select unnest(string_to_array(v_fldname_dcflds,'|')) fldname    		    	       			
					loop		    	
						v_fldname_col := split_part(rec2.fldname,'~',1);
						v_fldname_normalized := split_part(rec2.fldname,'~',2);
						v_fldname_srctbl := split_part(rec2.fldname,'~',3);
						v_fldname_srcfld := split_part(rec2.fldname,'~',4);	
						v_fldname_allowempty := split_part(rec2.fldname,'~',5);
				    
											
						if v_fldname_normalized ='F' then 
							v_fldnamesary := array_append(v_fldnamesary,concat(v_fldname_dctablename,'.',v_fldname_col)::varchar);
						elsif v_fldname_normalized ='T' then	
							v_fldnamesary := array_append(v_fldnamesary,concat(v_fldname_col,'.',v_fldname_srcfld,' ',v_fldname_col)::varchar);	
							v_fldname_joinsary := array_append(v_fldname_joinsary,concat(case when v_fldname_allowempty='F' then ' join ' else ' left join ' end,v_fldname_srctbl,' ',v_fldname_col,' on ',v_fldname_dctablename,'.',v_fldname_col,' = ',v_fldname_col,'.',v_fldname_srctbl,'id')::Varchar);
						end if;
									
				    end loop;
		   
			end loop;

		   	v_sql := concat(' select count(*) from ',v_primarydctable,' ',array_to_string(v_fldname_dcjoinsary,' '),' ',array_to_string(v_fldname_joinsary,' '));
 

		   			
---------DAC filters
			   if v_dacenabled > 0 then
				   
			   	
			
			   ------------------ DAC V5
			    for dacrec in 
			   	select fname,tablename,
					case when filtercnd in('like','not like') then case when isglovar='F' then '''%'''||attribvalue||'''%''' else 
					case when lower(trim(attribvalue))=':username' then  '''%'||pusername||'%''' else '''%''||'||attribvalue||'||''%''' end end
					when filtercnd in('in','not in') then case when isglovar='F' then replace(attribvalue,',',''',''')||'''' else attribvalue end
					when filtercnd in('=','!=','>','<') then case when isglovar='F' then ''''||attribvalue||'''' else attribvalue end  end cnd,
					ord,filtercnd  from
					(
					select case when b.dynamicval ='No' and a.dataaccesscnd = 30 then b.fldstaticval when b.dynamicval ='Yes' and a.dataaccesscnd = 30 then b.fldmastvalue end  attribvalue,f.fname,f.tablename,1 ord, b.filtercnd,b.isglovar
					from axpdef_dac_config a join axpdef_dac_configdtl b on a.axpdef_dac_configid =  b.axpdef_dac_configid
					join axpflds f on a.stransid =f.tstruct and b.fldname = f.fname 
					where a.uname = pusername  and a.stransid = ptransid and a.editmode='Edit'
					and a.dataaccesscnd = 30 and v_dactype in(2,3)					
					union all					
					select  pusername attribvalue, 'createdby' ,d.tablename,1 ord,'='filtercnd,'F'
					from axpdef_dac_config a 
					join axpdc d on a.stransid =d.tstruct and d.dname= 'dc1' 
					where a.uname = pusername and a.dataaccesscnd in (10,11) and a.stransid = ptransid and a.editmode='Edit' and v_dactype in(2,3)					
					union all					
					select case when b.dynamicval ='No' and a.dataaccesscnd = 30 then b.fldstaticval when b.dynamicval ='Yes' and a.dataaccesscnd = 30 then b.fldmastvalue end  attribvalue,f.fname,f.tablename,2 ord, b.filtercnd,b.isglovar
					from axpdef_dac_config a join axpdef_dac_configdtl b on a.axpdef_dac_configid =  b.axpdef_dac_configid
					join axpflds f on a.stransid =f.tstruct and b.fldname = f.fname 
					join axuserlevelgroups u on a.urole = u.usergroup and ((u.startdate is not null and current_date  >= startdate) or (startdate is null)) and ((enddate is not null and current_date  <= enddate) or (enddate is null))
					and u.username = pusername and a.stransid = ptransid and a.editmode='Edit'
					where a.dataaccesscnd =30 and v_dactype = 1					
					union all
					select  pusername attribvalue, 'createdby' ,d.tablename,2 ord,'='filtercnd ,'F'
					from axpdef_dac_config a 
					join axpdc d on a.stransid =d.tstruct and d.dname= 'dc1'
					join axuserlevelgroups u on a.urole = u.usergroup and ((u.startdate is not null and current_date  >= startdate) or (startdate is null)) and ((enddate is not null and current_date  <= enddate) or (enddate is null))
					and u.username = pusername and a.stransid = ptransid and a.editmode='Edit'
					where a.dataaccesscnd in (10,11) and v_dactype = 1
					)a
					order by ord
					
					loop												
					
						v_dac_cnd := concat(dacrec.tablename,'.',dacrec.fname,' ',dacrec.filtercnd,'(',dacrec.cnd	,')');
					
						v_dac_cndary := array_append(v_dac_cndary,v_dac_cnd);
											
					end loop;								   					   			   							
				
			   end if;		   			
		   			
				

			v_sql1 := concat(v_sql,' where ',v_primarydctable,'id=',precordid,case when v_dacenabled > 0 then concat(' and ',array_to_string(v_dac_cndary,' and ')) end);
	
	


return v_sql1;


END; $function$
;

>>

-- DROP FUNCTION fn_axpanalytics_filterdata(varchar, text);

<<

CREATE OR REPLACE FUNCTION fn_axpanalytics_filterdata(ptransid character varying, pflds text)
 RETURNS TABLE(datavalue character varying)
 LANGUAGE plpgsql
AS $function$
declare 
v_sql text;
begin
---pflds - fldname~normalized~source table~source fld
	
	
	if split_part(pflds,'~',2)='T' then	
		v_sql := concat('select ',split_part(pflds,'~',4),' from ',split_part(pflds,'~',3));
	end if;
		
	
return query execute v_sql;
--return v_sql1;

END; $function$
;

>>
-- vw_entityrelations source

<<

CREATE OR REPLACE VIEW vw_entityrelations
AS SELECT DISTINCT nextval('ax_entity_relseq'::regclass) AS axentityrelationsid,
    'F'::text AS cancel,
    'admin'::text AS username,
    CURRENT_TIMESTAMP AS modifiedon,
    'admin'::text AS createdby,
    CURRENT_TIMESTAMP AS createdon,
    1 AS app_level,
    1 AS app_desc,
    a.rtype,
    a.mstruct,
    a.mfield,
    m.tablename AS mtable,
    dc.tablename AS primarytable,
    a.dstruct,
    a.dfield,
    d.tablename AS dtable,
    'Dropdown'::text AS rtypeui,
    concat(mt.caption, '-(', mt.name, ')') AS mstructui,
    concat(m.caption, '-(', m.fname, ')') AS mfieldui,
    concat(dt.caption, '-(', dt.name, ')') AS dstructui,
    concat(d.caption, '-(', d.fname, ')') AS dfieldui,
    ddc.tablename AS dprimarytable
   FROM ( SELECT DISTINCT axrelations.mstruct,
            axrelations.dstruct,
            axrelations.mfield,
            axrelations.dfield,
            axrelations.rtype
           FROM axrelations) a
     JOIN tstructs mt ON a.mstruct::text = mt.name::text
     JOIN tstructs dt ON a.dstruct::text = dt.name::text
     LEFT JOIN axpflds m ON a.mstruct::text = m.tstruct::text AND a.mfield::text = m.fname::text
     LEFT JOIN axpflds d ON a.dstruct::text = d.tstruct::text AND a.dfield::text = d.fname::text
     LEFT JOIN axpdc dc ON a.mstruct::text = dc.tstruct::text AND dc.dname::text = 'dc1'::text
     LEFT JOIN axpdc ddc ON a.dstruct::text = ddc.tstruct::text AND ddc.dname::text = 'dc1'::text
  WHERE a.rtype::text = 'md'::text
UNION ALL
 SELECT DISTINCT nextval('ax_entity_relseq'::regclass) AS axentityrelationsid,
    'F'::text AS cancel,
    'admin'::text AS username,
    CURRENT_TIMESTAMP AS modifiedon,
    'admin'::text AS createdby,
    CURRENT_TIMESTAMP AS createdon,
    1 AS app_level,
    1 AS app_desc,
    'gm'::character varying AS rtype,
    a.tstruct AS mstruct,
    concat(sd.tablename, 'id') AS mfield,
    sd.tablename AS mtable,
    pd.tablename AS primarytable,
    a.targettstr AS dstruct,
    'sourceid'::character varying AS dfield,
    td.tablename AS dtable,
    'Genmap'::text AS rtypeui,
    concat(mt.caption, '-(', mt.name, ')') AS mstructui,
    NULL::text AS mfieldui,
    concat(dt.caption, '-(', dt.name, ')') AS dstructui,
    NULL::text AS dfieldui,
    td.tablename AS dprimarytable
   FROM axpgenmaps a
     JOIN tstructs mt ON a.tstruct::text = mt.name::text
     JOIN tstructs dt ON a.targettstr::text = dt.name::text
     LEFT JOIN axpdc sd ON a.tstruct::text = sd.tstruct::text AND sd.dname::text = a.basedondc::text
     LEFT JOIN axpdc td ON a.targettstr::text = td.tstruct::text AND td.dname::text = 'dc1'::text
     LEFT JOIN axpdc pd ON a.tstruct::text = pd.tstruct::text AND pd.dname::text = 'dc1'::text;

>>


-- DROP FUNCTION fn_axpanalytics_ins_axreltn();

<<

CREATE OR REPLACE FUNCTION fn_axpanalytics_ins_axreltn()
 RETURNS void
 LANGUAGE plpgsql
AS $function$ 
begin
	
delete from axentityrelations where rtype!='custom';
 
insert into axentityrelations ( 
axentityrelationsid,cancel,username,modifiedon,createdby,createdon,app_level,app_desc,
rtype,mstruct,mfield,mtable,primarytable,dstruct,dfield,dtable,rtypeui,mstructui,mfieldui,dstructui,dfieldui,dprimarytable)
select * from vw_entityrelations;
 
	
end;

$function$
;

>>

-- DROP FUNCTION fn_axpanalytics_listdata(varchar, text, numeric, numeric, text, varchar, varchar);
<<

CREATE OR REPLACE FUNCTION fn_axpanalytics_listdata(ptransid character varying, pflds text DEFAULT 'All'::text, ppagesize numeric DEFAULT 25, ppageno numeric DEFAULT 1, pfilter text DEFAULT 'NA'::text, pusername character varying DEFAULT 'admin'::character varying, papplydac character varying DEFAULT 'T'::character varying)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
declare 
rec record;
rec1 record;
rec2 record;
dacrec record;
v_sql text;
v_sql1 text;
v_primarydctable varchar;
v_fldnamesary varchar[] DEFAULT  ARRAY[]::varchar[];
v_fldname_joinsary varchar[] DEFAULT  ARRAY[]::varchar[];
v_fldname_col varchar;
v_fldname_normalized varchar;
v_fldname_srctbl varchar;
v_fldname_srcfld varchar;
v_fldname_allowempty varchar;
v_fldname_dcjoinsary varchar[] DEFAULT  ARRAY[]::varchar[];
v_fldname_dctablename varchar;
v_fldname_dcflds text;
v_fldname_dctables varchar[] DEFAULT  ARRAY[]::varchar[];
v_fldname_normalizedtables varchar[] DEFAULT  ARRAY[]::varchar[];
v_fldname_transidcnd numeric;
v_allflds varchar;
v_filter_srcfld varchar;
v_filter_srctxt varchar;
v_filter_join varchar;
v_filter_joinsary varchar[] DEFAULT  ARRAY[]::varchar[];
v_filter_cnd varchar;
v_filter_cndary varchar[] DEFAULT  ARRAY[]::varchar[];
v_filter_joinreq numeric;
v_filter_dcjoinsary varchar[] DEFAULT  ARRAY[]::varchar[];
v_filter_col varchar;
v_filter_normalized varchar;
v_filter_sourcetbl varchar;
v_filter_sourcefld varchar;
v_filter_datatype varchar;
v_filter_listedfld varchar;
v_filter_tablename varchar;
v_fldname_tables varchar[] DEFAULT  ARRAY[]::varchar[];
v_dacenabled numeric;
v_dactype numeric;
v_dac_join varchar;
v_dac_joinsary varchar[] DEFAULT  ARRAY[]::varchar[];
v_dac_cnd varchar;
v_dac_cndary varchar[] DEFAULT  ARRAY[]::varchar[];
v_dac_joinreq numeric;
v_dac_normalizedjoinreq numeric; 

begin

/*
---pflds - tbl1=fldname~normalized~source_table~source_fld~mandatory|fldname~normalized~source_table~source_fld~mandatory^
		tb12=fldname~normalized~source_table~source_fld~mandatory|fldname~normalized~source_table~source_fld~mandatory
 */
	
/* pfilter
search field|operator search text^ 
fldname~normalized~sourcetable~sourcefld~datatype~listedfield~tablename| operator search text^
*/
		

	select tablename into v_primarydctable from axpdc where tstruct = ptransid and dname ='dc1';


----DAC V5
	select sum(cnt),sum(appl) into v_dacenabled,v_dactype from
(select count(*) cnt,2 appl from axpdef_dac_config a  
where a.uname = pusername and a.stransid = ptransid and a.editmode='View'
having count(*) > 0
union all
select count(*),1 appl from axpdef_dac_config a  join axuserlevelgroups a2 on a.urole = a2.usergroup 
where a2.username = pusername and a.stransid = ptransid and a.editmode='View'
and ((a2.startdate is not null and current_date  >= startdate) or (startdate is null)) and ((enddate is not null and current_date  <= enddate) or (enddate is null))
having count(*) > 0
)a
where 'T' = papplydac;

	
	select count(1) into v_fldname_transidcnd from axpflds where tstruct = ptransid and dcname ='dc1' and lower(fname)='transid';

		if pflds = 'All' then 		
			select concat(tablename,'=',string_agg(str,'|'))  into v_allflds From(
			select tablename, concat(fname,'~',srckey,'~',srctf,'~',srcfld,'~',allowempty) str
			from axpflds where tstruct=ptransid and dcname='dc1' and 
			asgrid ='F' and hidden ='F' and savevalue='T' and tablename = v_primarydctable and datatype not in('i','t')
			order by dcname ,ordno)a group by a.tablename;		
		end if;
						
		FOR rec1 IN
    		select unnest(string_to_array(case when pflds='All' then v_allflds else pflds end,'^')) dcdtls
    		loop	
    			v_fldname_dctablename := split_part(rec1.dcdtls,'=',1);
				v_fldname_dcflds := split_part(rec1.dcdtls,'=',2);
			
			if v_fldname_dctablename!=v_primarydctable then
						v_fldname_dcjoinsary := array_append(v_fldname_dcjoinsary,concat('left join ',v_fldname_dctablename,' on ',v_primarydctable,'.',v_primarydctable,'id=',v_fldname_dctablename,'.',v_primarydctable,'id') );						
					end if;
					v_fldname_dctables := array_append(v_fldname_dctables,v_fldname_dctablename);

			FOR rec2 IN
    		select unnest(string_to_array(v_fldname_dcflds,'|')) fldname    		    	       			
				loop		    	
					v_fldname_col := split_part(rec2.fldname,'~',1);
					v_fldname_normalized := split_part(rec2.fldname,'~',2);
					v_fldname_srctbl := split_part(rec2.fldname,'~',3);
					v_fldname_srcfld := split_part(rec2.fldname,'~',4);	
					v_fldname_allowempty := split_part(rec2.fldname,'~',5);
			    
				
					
					if v_fldname_normalized ='F' then 
						v_fldnamesary := array_append(v_fldnamesary,concat(v_fldname_dctablename,'.',v_fldname_col)::varchar);
					elsif v_fldname_normalized ='T' then	
						v_fldnamesary := array_append(v_fldnamesary,concat(v_fldname_col,'.',v_fldname_srcfld,' ',v_fldname_col)::varchar);	
						v_fldname_joinsary := array_append(v_fldname_joinsary,concat(case when v_fldname_allowempty='F' then ' join ' else ' left join ' end,v_fldname_srctbl,' ',v_fldname_col,' on ',v_fldname_dctablename,'.',v_fldname_col,' = ',v_fldname_col,'.',v_fldname_srctbl,'id')::Varchar);
						v_fldname_normalizedtables := array_append(v_fldname_normalizedtables,lower(v_fldname_srctbl));
					end if;
								
			    end loop;
		   
			   end loop;
		   	v_sql := concat(' select ','''',ptransid,''' transid,',v_primarydctable,'.',v_primarydctable,'id recordid,',v_primarydctable,'.username modifiedby,',v_primarydctable,'.modifiedon,',
		   			 array_to_string(v_fldnamesary,','),',b.axpeg_processname,b.axpeg_keyvalue,b.axpeg_status,b.axpeg_statustext from ',v_primarydctable,' ',
		   			 array_to_string(v_fldname_dcjoinsary,' '),' ',array_to_string(v_fldname_joinsary,' '),
		   			 ' left join fn_axpanalytics_pegstatus(''',ptransid,''',',v_primarydctable,'.',v_primarydctable,'id) b on ',
		   			 v_primarydctable,'.',v_primarydctable,'id=b.axpeg_recordid');
 

		   			
---------DAC filters
			   if v_dacenabled > 0 then
				   
			   	
			
			   ------------------ DAC V5
			     for dacrec in 			   
					select fname,tablename,srckey,srctf,srcfld,
					case when filtercnd in('like','not like') then case when isglovar='F' then '''%'||attribvalue||'%''' else 
					case when lower(trim(attribvalue))=':username' then  '''%'||pusername||'%''' else '''%''||'||attribvalue||'||''%''' end end
					when filtercnd in('in','not in') then case when isglovar='F' then ''''||replace(attribvalue,',',''',''')||'''' else case when lower(trim(attribvalue))=':username' then  ''''||pusername||'''' else attribvalue end end
					when filtercnd in('=','!=','>','<') then case when isglovar='F' then ''''||attribvalue||'''' else case when lower(trim(attribvalue))=':username' then  ''''||pusername||'''' else attribvalue end end  end cnd,
					ord,filtercnd  from
					(
					select case when b.dynamicval ='No' and a.dataaccesscnd = 30 then b.fldstaticval when b.dynamicval ='Yes' and a.dataaccesscnd = 30 then b.fldmastvalue end  attribvalue,
					f.fname,f.tablename,1 ord, b.filtercnd,b.isglovar,f.srckey,f.srctf,f.srcfld
					from axpdef_dac_config a join axpdef_dac_configdtl b on a.axpdef_dac_configid =  b.axpdef_dac_configid
					join axpflds f on a.stransid =f.tstruct and b.fldname = f.fname 
					where a.uname = pusername  and a.stransid = ptransid and a.editmode='View'
					and a.dataaccesscnd = 30 and v_dactype in(2,3)					
					union all			
					select case when b.dynamicval ='No' and a.dataaccesscnd = 30 then b.fldstaticval when b.dynamicval ='Yes' and a.dataaccesscnd = 30 then b.fldmastvalue end  attribvalue,
					b.fldname ,d.tablename,1 ord, b.filtercnd,b.isglovar,'F',null,null
					from axpdef_dac_config a join axpdef_dac_configdtl b on a.axpdef_dac_configid =  b.axpdef_dac_configid
					join axpdc d on a.stransid =d.tstruct and d.dname= 'dc1' 
					where a.uname = pusername  and a.stransid = ptransid and a.editmode='View'
					and a.dataaccesscnd = 30 and b.fldname in('createdby','username')  and v_dactype in(2,3)
					union all		
					select  pusername attribvalue, 'createdby' ,d.tablename,1 ord,'='filtercnd,'F','F' srckey,null srctf, null srcfld
					from axpdef_dac_config a 
					join axpdc d on a.stransid =d.tstruct and d.dname= 'dc1' 
					where a.uname = pusername and a.dataaccesscnd in (10,11) and a.stransid = ptransid and a.editmode='View' and v_dactype in(2,3)					
					union all					
					select case when b.dynamicval ='No' and a.dataaccesscnd = 30 then b.fldstaticval when b.dynamicval ='Yes' and a.dataaccesscnd = 30 then b.fldmastvalue end  attribvalue,
					f.fname,f.tablename,2 ord, b.filtercnd,b.isglovar,f.srckey,f.srctf,f.srcfld
					from axpdef_dac_config a join axpdef_dac_configdtl b on a.axpdef_dac_configid =  b.axpdef_dac_configid
					join axpflds f on a.stransid =f.tstruct and b.fldname = f.fname 
					join axuserlevelgroups u on a.urole = u.usergroup and ((u.startdate is not null and current_date  >= startdate) or (startdate is null)) and ((enddate is not null and current_date  <= enddate) or (enddate is null))
					and u.username = pusername and a.stransid = ptransid and a.editmode='View'
					where a.dataaccesscnd =30 and v_dactype = 1
					union all
					select case when b.dynamicval ='No' and a.dataaccesscnd = 30 then b.fldstaticval when b.dynamicval ='Yes' and a.dataaccesscnd = 30 then b.fldmastvalue end  attribvalue,
					b.fldname,d.tablename,2 ord, b.filtercnd,b.isglovar,'F',null,null
					from axpdef_dac_config a join axpdef_dac_configdtl b on a.axpdef_dac_configid =  b.axpdef_dac_configid
					join axpdc d on a.stransid =d.tstruct and d.dname= 'dc1'
					join axuserlevelgroups u on a.urole = u.usergroup and ((u.startdate is not null and current_date  >= startdate) or (startdate is null)) and ((enddate is not null and current_date  <= enddate) or (enddate is null))
					and u.username = pusername and a.stransid = ptransid and a.editmode='View'
					where a.dataaccesscnd =30 and v_dactype = 1	and  b.fldname in('createdby','username') 						
					union all
					select  pusername attribvalue, 'createdby' ,d.tablename,2 ord,'='filtercnd ,'F','F' srckey,null srctf, null srcfld
					from axpdef_dac_config a 
					join axpdc d on a.stransid =d.tstruct and d.dname= 'dc1'
					join axuserlevelgroups u on a.urole = u.usergroup and ((u.startdate is not null and current_date  >= startdate) or (startdate is null)) and ((enddate is not null and current_date  <= enddate) or (enddate is null))
					and u.username = pusername and a.stransid = ptransid and a.editmode='View'
					where a.dataaccesscnd in (10,11) and v_dactype = 1
					)a
					order by ord 
					
					loop
						
						select count(1) into v_dac_joinreq from (
						select distinct unnest(v_fldname_dctables)tbls 
						union 
						select distinct unnest(v_fldname_normalizedtables)								
						)a 
						where lower(a.tbls)=lower(dacrec.tablename);	


						if dacrec.srckey ='T' then
						select count(1) into v_dac_normalizedjoinreq from (
						select distinct unnest(v_fldname_dctables)tbls 
						union 
						select distinct unnest(v_fldname_normalizedtables)								
						)a 
						where lower(a.tbls)=lower(dacrec.srctf);	
						end if;		


						if v_dac_normalizedjoinreq = 0 then
						v_dac_joinsary := array_append(v_dac_joinsary,concat(' join ',dacrec.srctf,' on ',dacrec.srctf,'.',dacrec.srctf,'id=',dacrec.tablename,'.',dacrec.fname));
						v_fldname_dctables := array_append(v_fldname_dctables,dacrec.srctf);						
						end if;
	
							
						if v_dac_joinreq = 0 then
						v_dac_joinsary := array_append(v_dac_joinsary,concat(' join ',dacrec.tablename,' on ',v_primarydctable,'.',v_primarydctable,'id=',dacrec.tablename,'.',v_primarydctable,'id') );
						v_fldname_dctables := array_append(v_fldname_dctables,dacrec.tablename);		
						end if;							

						v_dac_cnd := case 
									 when dacrec.srckey='F' then  concat(dacrec.tablename,'.',dacrec.fname,' ',dacrec.filtercnd,'(', case when dacrec.filtercnd in('in','not in') then 'select unnest(string_to_array('||dacrec.cnd||','',''))' else dacrec.cnd	end,')')  
									 when 	dacrec.srckey='T' then  
									 case when v_dac_normalizedjoinreq = 0 then concat(dacrec.srctf,'.',dacrec.srcfld,' ',dacrec.filtercnd,'(',case when dacrec.filtercnd in('in','not in') then 'select unnest(string_to_array('||dacrec.cnd||','',''))' else dacrec.cnd	end	,')') 
									else concat(dacrec.fname,'.',dacrec.srcfld,' ',dacrec.filtercnd,'(',case when dacrec.filtercnd in('in','not in') then 'select unnest(string_to_array('||dacrec.cnd||','',''))' else dacrec.cnd	end	,')') end
									end;
					
					
						v_dac_cndary := array_append(v_dac_cndary,v_dac_cnd);									
					
					end loop;								   					   			   							
				
			   end if;		   			
		   			
			
		if coalesce(pfilter,'NA') ='NA' then 

			v_sql1 := concat('select b.* from(select a.*,row_number() over(order by modifiedon desc)::Numeric rno,
			case when mod(row_number() over(order by modifiedon desc),',ppagesize,')=0 then row_number() over(order by modifiedon desc)/',ppagesize,' else row_number() over(order by modifiedon desc)/',ppagesize,'+1 end::numeric pageno from 
			(',concat(v_sql,array_to_string(v_dac_joinsary,' '),' where ',v_primarydctable,'.cancel=''F''',case when v_fldname_transidcnd>0 then concat(' and ',v_primarydctable,'.transid=','''',ptransid,'''') else '' end,
			case when v_dacenabled > 0 then concat(' and ',array_to_string(v_dac_cndary,' and ')) end),'
			--axp_filter
			',')a order by modifiedon desc limit ',ppagesize*ppageno,' )b ',case when ppageno=0 then '' else concat('where pageno=',ppageno) end);
	
		else 
			FOR rec IN
    			select unnest(string_to_array(pfilter,'^')) ifilter
			    loop		    	
			    	v_filter_srcfld := split_part(rec.ifilter,'|',1);
			    	v_filter_srctxt := split_part(rec.ifilter,'|',2);
			    	v_filter_col := split_part(v_filter_srcfld,'~',1);
				    v_filter_normalized := split_part(v_filter_srcfld,'~',2);
 				    v_filter_sourcetbl := split_part(v_filter_srcfld,'~',3);
 				    v_filter_sourcefld := split_part(v_filter_srcfld,'~',4);
					   v_filter_datatype := split_part(v_filter_srcfld,'~',5);
					v_filter_listedfld :=split_part(v_filter_srcfld,'~',6);
				v_filter_tablename:=split_part(v_filter_srcfld,'~',7);
					
		
			    				    	
			    	if  v_filter_listedfld = 'F' then
			    	
					select count(1) into v_filter_joinreq from (select distinct unnest(v_fldname_dctables)tbls )a where lower(a.tbls)=lower(v_filter_tablename);			    		
					
			    	if v_filter_joinreq = 0  then 
				    	v_filter_dcjoinsary := array_append(v_filter_dcjoinsary,concat(' join ',v_filter_tablename,' on ',v_primarydctable,'.',v_primarydctable,'id=',v_filter_tablename,'.',v_primarydctable,'id') );
				    	v_fldname_tables := array_append(v_fldname_tables,v_filter_tablename);
			    	end if;
			    
			    	
			    
		    		select case when v_filter_normalized='T' 
					then concat(' join ',v_filter_sourcetbl,' ',v_filter_col,' on ',v_filter_tablename,'.',v_filter_col,' = ',v_filter_col,'.',v_filter_sourcetbl,'id')
					end into v_filter_join from dual where v_filter_normalized='T';
					
					 
					v_filter_joinsary :=array_append(v_filter_joinsary,v_filter_join);				
					
				
					end if;
			
									
					select case when v_filter_normalized='F' 
					then concat(case when v_filter_datatype='c' then 'lower(' end,v_filter_tablename,'.',v_filter_col,case when v_filter_datatype='c' then ')' end,' ',v_filter_srctxt) 
					else concat(case when v_filter_datatype='c' then 'lower(' end,v_filter_col,'.',v_filter_sourcefld,case when v_filter_datatype='c' then ')' end,' ',v_filter_srctxt) 
					end into v_filter_cnd;
		    	
					v_filter_cndary := array_append(v_filter_cndary,v_filter_cnd);				
			
									
			    end loop;
			   
			   	v_filter_dcjoinsary := ARRAY(SELECT DISTINCT UNNEST(v_filter_dcjoinsary));				   					   
			   
			   
				v_sql1 := concat('select b.* from(select a.*,row_number() over(order by modifiedon desc)::Numeric rno,
						case when mod(row_number() over(order by modifiedon desc),',ppagesize,')=0 then row_number() over(order by modifiedon desc)/',ppagesize,' else row_number() over(order by modifiedon desc)/',ppagesize,'+1 end::numeric pageno from 
						(',v_sql,concat(array_to_string(v_filter_dcjoinsary,' '),array_to_string(v_filter_joinsary,' '),array_to_string(v_dac_joinsary,' '),' where ',v_primarydctable,'.cancel=''F'' and ',case when v_fldname_transidcnd>0 then concat(v_primarydctable,'.transid=','''',ptransid,''' and ') else '' end,
						array_to_string(v_filter_cndary,' and '),case when v_dacenabled > 0 then concat(' and ',array_to_string(v_dac_cndary,' and ')) end),'
						--axp_filter
						',')a order by modifiedon desc limit ',ppagesize*ppageno,' )b ',case when ppageno=0 then '' else concat('where pageno=',ppageno) end);					    						
		end if;

return v_sql1;


END; $function$
;

>>

-- DROP FUNCTION fn_axpanalytics_metadata(varchar, varchar);

<<

CREATE OR REPLACE FUNCTION fn_axpanalytics_metadata(ptransid character varying, psubentity character varying DEFAULT 'F'::character varying)
 RETURNS SETOF axpdef_axpanalytics_mdata
 LANGUAGE plpgsql
AS $function$
declare
r axpdef_axpanalytics_mdata%rowtype;
rec record;
v_subentitytable varchar;
v_sql text;
v_subentitysql text;
v_primarydctable varchar;
begin
 

	select tablename into v_primarydctable from axpdc where tstruct = ptransid and dname ='dc1';

	select concat('select axpflds.tstruct transid,t.caption formcap, fname ,axpflds.caption fcap,customdatatype cdatatype,"datatype" dt,modeofentry,
	hidden fhide,cast(null as varchar) props,srckey ,srctf ,srcfld ,srctrans ,axpflds.allowempty,
	case when modeofentry =''select'' then case when srckey =''T'' then ''Dropdown'' else ''Text'' end else ''Text'' end::varchar filtercnd,
	case when (modeofentry =''select'' or datatype=''c'') then ''T'' else ''F'' end::varchar grpfld,
	case when "datatype" =''n'' then ''T'' else ''F'' end::varchar aggfld,''F'' subentity,1 datacnd,null entityrelfld,allowduplicate,axpflds.tablename,
	dcname,ordno,d.caption dccaption,d.asgrid,case when d.asgrid=''F'' then ''T'' else ''F'' end listingfld
	from axpflds join tstructs t on axpflds.tstruct = t.name join axpdc d on axpflds.tstruct = d.tstruct and axpflds.dcname = d.dname
	where axpflds.tstruct=','''',ptransid,''' and savevalue =''T'' 
	union all
	select a.name,t.caption,key,title,	''button'',null,null,''F'',	concat(script, ''~'', icon),''F'',null,null,null,null,null,null,null,''F'' subentity,1,null,
	null,null,null,ordno,null,''F'',''F''
	from axtoolbar a join tstructs t on a.name = t.name
	where visible = ''true'' and script is not null and a.name= ','''',ptransid,'''') into v_sql;

	for r in execute v_sql
		loop	    	
			RETURN NEXT r; -- return current row of select
		END LOOP;	
	
if psubentity ='T' then		

    FOR rec IN
        select distinct a.dstruct ,--dc.tablename,
        a.rtype,dprimarytable  --,a.dfield,a.mfield
		from axentityrelations a 
		--join axpdc dc on a.dstruct = dc.tstruct --and dc.dname ='dc1' 
		--join axpflds d on a.dstruct =d.tstruct  and a.dfield = d.fname --and d.asgrid ='F'
		where rtype in('md','custom','gm') and mstruct = ptransid 
   	loop		
		
	   
select concat('select axpflds.tstruct transid,t.caption formcap, fname ,axpflds.caption fcap,customdatatype cdatatype,"datatype" dt,modeofentry ,hidden fhide,
		cast(null as varchar) props,srckey ,srctf ,srcfld ,srctrans ,axpflds.allowempty,
		case when modeofentry =''select'' then case when srckey =''T'' then ''Dropdown'' else ''Text'' end else ''Text'' end::varchar filtercnd,
		case when modeofentry =''select'' then ''T'' else ''F'' end::varchar grpfld,
		case when "datatype" =''n'' then ''T'' else ''F'' end::varchar aggfld,''T'' subentity,2 datacnd,
		case when srckey=''T'' and ''',ptransid,'''=r.mstruct then ''recordid'' when srckey=''F'' and ''',ptransid,''' = r.mstruct then r.mfield end entityrelfld,
		allowduplicate,axpflds.tablename,dcname,ordno,d.caption,d.asgrid,case when d.asgrid=''F'' then ''T'' else ''F'' end listingfld
		from axpflds join tstructs t on axpflds.tstruct = t.name join axpdc d on axpflds.tstruct = d.tstruct and axpflds.dcname = d.dname
		left join axentityrelations r on axpflds.tstruct = r.dstruct and axpflds.fname = r.dfield and r.mstruct=''',ptransid,'''		
		where axpflds.tstruct=','''',rec.dstruct,''' and savevalue =''T'' 
		union all select ','''',rec.dstruct,''',null,''sourceid'',''sourceid'',''Simple Text'',''c'',''accept'',''T'',
		null,''F'',null,null,null,''F'',null,''F'',''F'',''T'',2,''recordid'',''T'',','''',rec.dprimarytable,'''',',null,1000,null,''F'',''F''
		from dual where ''gm''=','''',rec.rtype,'''') into v_subentitysql;
	   	
	    for r in execute v_subentitysql
      		loop	    	
        		RETURN NEXT r; -- return current row of select        		
        	END LOOP;

    END LOOP;

end if;



--exception when others then insert into entitylog_v1 values('sql',v_sql,null);

END; $function$
;

>>

-- DROP FUNCTION fn_axpanalytics_pegstatus(varchar, numeric);

<<

CREATE OR REPLACE FUNCTION fn_axpanalytics_pegstatus(ptransid character varying, precordid numeric)
 RETURNS TABLE(axpeg_processname character varying, axpeg_keyvalue character varying, axpeg_status numeric, axpeg_statustext text, axpeg_recordid numeric)
 LANGUAGE plpgsql
AS $function$
declare 
v_pegtable text;
v_pegstatus numeric;

begin
	
	execute 'select status from axpeg_'||ptransid||' where recordid ='||precordid into v_pegstatus;

if v_pegstatus  in(1,2) then 

	return query execute 'select processname axpeg_processname,keyvalue axpeg_keyvalue,status::numeric axpeg_status,statustext::text axpeg_statustext,recordid::numeric axpeg_recordid from axpeg_'||ptransid||' 
where status in (1,2) and recordid ='||precordid;
else
return query execute 'select a.processname,keyvalue,0::numeric status,concat(a.taskname,'' is pending '',string_agg(a.touser,'','')) statustext
,recordid::numeric
from vw_pegv2_activetasks a 
where  a.recordid='||precordid||'
group by a.processname,a.keyvalue,a.taskname,a.recordid';

end if;

exception when others then null;


END; $function$
;

>>
-- DROP FUNCTION fn_axpanalytics_se_listdata(varchar, text, numeric, numeric);
<<

CREATE OR REPLACE FUNCTION fn_axpanalytics_se_listdata(pentity_transid character varying, pflds_keyval text, ppagesize numeric DEFAULT 50, ppageno numeric DEFAULT 1)
 RETURNS text
 LANGUAGE plpgsql
AS $function$
DECLARE
rec record;
rec1 record;
rec2 record;
v_sql text;
v_sql1 text;
v_fldname_table varchar;
v_fldname_col varchar;
v_fldname_normalized varchar;
v_fldname_srctbl varchar;
v_fldname_srcfld varchar;
v_fldname_allowempty varchar;
v_fldname_transidcnd numeric;
v_allflds varchar;
v_fldnamesary varchar[] DEFAULT  ARRAY[]::varchar[];
v_fldname_join varchar;
v_fldname_tblflds text;
v_fldname_joinsary varchar[] DEFAULT  ARRAY[]::varchar[];
v_emptyary varchar[] DEFAULT  ARRAY[]::varchar[];
v_pflds_transid varchar;
v_pflds_flds varchar;
v_pflds_keyvalue varchar;
v_pflds_keytable varchar;
v_keyvalue_fname varchar;
v_keyvalue_fvalue varchar;
v_final_sqls text[] DEFAULT  ARRAY[]::text[];
v_primarydctable varchar;
v_fldname_dcjoinsary varchar[] DEFAULT  ARRAY[]::varchar[];

begin	

	/*
	 * transid=fldlist=dependfld~depvalue~dependtblname~dependfldprops++transid2=fldlist=dependfld~depvalue
	 * pflds_keyval - transid=tablename!~fldname~normalized~source_table~source_fld~allowempty|fldname2~normalized~source_table~source_fld~allowempty^tablename2!~fldname~normalized~srctbl~srcfld~allowempty=dependfld~dependval++
	 * transid2=tablename!~fldname~normalized~source_table~source_fld~allowempty|fldname2~normalized~source_table~source_fld~allowempty=dependfld~dependval		 
	 */
	
	
	FOR rec in select unnest(string_to_array(pflds_keyval,'++')) fldkeyvals ---- multiple transid split   	 
    loop
	    	
	    	v_pflds_transid := split_part(rec.fldkeyvals,'=',1) ;	    	
	    	v_pflds_flds := split_part(rec.fldkeyvals,'=',2) ;--tablename=~fldname~normalized~source_table~source_fld~mandatory|fldname2~normalized~source_table~source_fld~mandatory^tablename2=~fldname~normalized~srctbl~srcfld~mandatory
	    	v_pflds_keyvalue := split_part(rec.fldkeyvals,'=',3) ;
	    	v_pflds_keytable := split_part(v_pflds_keyvalue,'~',3) ;  	    	
	    	

	    	select tablename into v_primarydctable from axpdc where tstruct =v_pflds_transid and dname ='dc1';
	    
	    	select count(1) into v_fldname_transidcnd from axpflds where tstruct = v_pflds_transid and dcname ='dc1' and lower(fname)='transid';
	    	    	    
	    
	    	if lower(v_pflds_keytable) = lower(v_primarydctable) and v_pflds_flds ='All' then
		    	select concat(tablename ,'!~',string_agg(str,'|'))  into v_allflds From(
				select tablename,concat(fname,'~',srckey,'~',srctf,'~',srcfld,'~',allowempty) str
				from axpflds where tstruct=v_pflds_transid and 
				dcname ='dc1' and 
				asgrid ='F' and hidden ='F' and savevalue='T' and datatype not in('i','t')
				order by dcname ,ordno)a group by a.tablename;
			elsif lower(v_pflds_keytable) != lower(v_primarydctable) and v_pflds_flds ='All' then
				select concat(tablename ,'!~',string_agg(str,'|'),'^',v_pflds_keytable,'!~',split_part(split_part(v_pflds_keyvalue,'~',1),'.',2),'~',split_part(v_pflds_keyvalue,'~',4),'~',split_part(v_pflds_keyvalue,'~',5),'~',split_part(v_pflds_keyvalue,'~',6),'~',split_part(v_pflds_keyvalue,'~',7))  into v_allflds From(
				select tablename,concat(fname,'~',srckey,'~',srctf,'~',srcfld,'~',allowempty) str
				from axpflds where tstruct=v_pflds_transid and 
				dcname ='dc1' and 
				asgrid ='F' and hidden ='F' and savevalue='T' and datatype not in('i','t')
				order by dcname ,ordno)a group by a.tablename;				
		    end if;
	    
	    for rec1 in select unnest(string_to_array(case when v_pflds_flds='All' then v_allflds else v_pflds_flds end,'^')) tblflds --single transid & single table split --tablename=~fldname~normalized~source_table~source_fld~mandatory|fldname2~normalized~source_table~source_fld~mandatory 
	    	loop		    			    			    			     
		    		v_fldname_table := 	split_part(rec1.tblflds,'!~',1);
		    		v_fldname_tblflds := 	split_part(rec1.tblflds,'!~',2);
		    		
		    	if lower(v_fldname_table)!=lower(v_primarydctable) then
					v_fldname_dcjoinsary := array_append(v_fldname_dcjoinsary,concat('left join ',v_fldname_table,' on ',v_primarydctable,'.',v_primarydctable,'id=',v_fldname_table,'.',v_primarydctable,'id') );		    							
				end if;
		    
				if lower(v_fldname_table)!=lower(v_pflds_keytable) then
					v_fldname_dcjoinsary := array_append(v_fldname_dcjoinsary,concat('left join ',v_pflds_keytable,' on ',v_primarydctable,'.',v_primarydctable,'id=',v_pflds_keytable,'.',v_primarydctable,'id') );		    							
				end if;
				
		    			    	
			    FOR rec2 in			    	
    				select unnest(string_to_array(v_fldname_tblflds,'|')) fldname--tablename=~fldname~normalized~source_table~source_fld~mandatory
						loop							
							v_fldname_col := split_part(rec2.fldname,'~',1);
							v_fldname_normalized := split_part(rec2.fldname,'~',2);
							v_fldname_srctbl := split_part(rec2.fldname,'~',3);
							v_fldname_srcfld := split_part(rec2.fldname,'~',4);														
							v_fldname_allowempty := split_part(rec2.fldname,'~',5);
							v_keyvalue_fname := split_part(v_pflds_keyvalue,'~',1);
							v_keyvalue_fvalue := split_part(v_pflds_keyvalue,'~',2);				
						
							
							
							if v_fldname_normalized ='F' then 
								v_fldnamesary := array_append(v_fldnamesary,concat(v_fldname_table,'.',v_fldname_col)::varchar);
							elsif v_fldname_normalized ='T' then	
								v_fldnamesary := array_append(v_fldnamesary,concat(v_fldname_col,'.',v_fldname_srcfld,' ',v_fldname_col)::varchar);	
								
								v_fldname_joinsary := array_append(v_fldname_joinsary,concat(case when v_fldname_allowempty='F' then ' join ' else ' left join ' end,v_fldname_srctbl,' ',v_fldname_col,' on ',v_fldname_table,'.',v_fldname_col,' = ',v_fldname_col,'.',v_fldname_srctbl,'id')::Varchar);
							end if;								
						
							

			    		end loop;
		   end loop;
		  
		  v_fldname_dcjoinsary := ARRAY(SELECT DISTINCT UNNEST(v_fldname_dcjoinsary));	
		   
		   	v_sql := concat(' select ','''',v_pflds_transid,''' transid,',v_primarydctable,'.',v_primarydctable,'id recordid,',v_primarydctable,'.username modifiedby,',v_primarydctable,'.modifiedon,',
		   			 array_to_string(v_fldnamesary,','),',b.axpeg_processname,b.axpeg_keyvalue,b.axpeg_status,b.axpeg_statustext from ',v_primarydctable,' ',array_to_string(v_fldname_dcjoinsary,' '),' ',array_to_string(v_fldname_joinsary,' '),
		   			' left join fn_axpanalytics_pegstatus(''',v_pflds_transid,''',',v_primarydctable,'.',v_primarydctable,'id) b on ',v_primarydctable,'.',v_primarydctable,'id=b.axpeg_recordid',' where ',v_primarydctable,'.cancel=''F'' and ',case when v_fldname_transidcnd>0 then concat(v_primarydctable,'.transid=','''',v_pflds_transid,''' and ') end ,v_keyvalue_fname,'=',v_keyvalue_fvalue,'
					--axp_filter
					');

		   				v_fldnamesary:= v_emptyary;
		   				v_fldname_joinsary:= v_emptyary;	   				
		   				v_fldname_dcjoinsary:= v_emptyary;	   				
	 
	    
	    
	   v_sql1 := concat('select * from(select a.*,row_number() over(order by modifiedon desc)::Numeric rno,
			case when mod(row_number() over(order by modifiedon desc),',ppagesize,')=0 then row_number() over(order by modifiedon desc)/',ppagesize,' else row_number() over(order by modifiedon desc)/',ppagesize,'+1 end::numeric pageno from 
			(',v_sql,')a order by modifiedon desc limit ',ppagesize*ppageno,' )b ',case when ppageno=0 then '' else concat('where pageno=',ppageno) end);
		
		
		
v_final_sqls := array_append(v_final_sqls,v_sql1);

    END LOOP;
  
--exception when others then insert into entitylog values('Exec',v_sql1);
    return array_to_string(v_final_sqls,'^^^') ;
   	--return v_allflds;
END;
$function$
;

>>

<<

CREATE OR REPLACE FUNCTION fn_dac_masterdata(pmtransid character varying, pmfldname character varying, pminctransid numeric, pmcnd numeric)
 RETURNS TABLE(datavalue character varying)
 LANGUAGE plpgsql
AS $function$
declare 
v_sql text;
v_mastertable varchar(50);
begin
	
	
	if pmcnd = 2 then 
	select tablename into v_mastertable from axpflds where tstruct = pmtransid and fname = pmfldname;
	else 
	v_mastertable = pmtransid;
	end if; 	

	v_sql := concat('select distinct ',pmfldname,' from ',v_mastertable,case when pminctransid = 0 then null else concat('where transid = ','''',pmtransid,'''') end );
					
	

return query execute v_sql;

exception when others then null;

END; 
$function$
;

>>

<<

ALTER TABLE executeapidef ADD execapiauthstring varchar(100) NULL;

>>

<<

INSERT INTO axdirectsql (axdirectsqlid, cancel, sourceid, mapname, username, modifiedon, createdby, createdon, wkid, app_level, app_desc, app_slevel, cancelremarks, wfroles, sqlname, ddldatatype, sqltext, paramcal, sqlparams, accessstring, groupname, sqlsrc, sqlsrccnd) VALUES(1239660000000, 'F', 0, NULL, 'admin', '2024-09-05', 'admin', '2024-08-05', NULL, 1, 1, 0, NULL, NULL, 'DAC_Master_Data', NULL, 'SELECT fn_dac_masterdata(:pmtransid, :pmfldname, cast( :pminctransid as numeric), cast( :pmcnd as numeric) ) from dual
union all
select concat('':'',fname) from axpflds where tstruct=''axglo''
union all
select concat('':'',db_varname)  from axpdef_axvars_dbvar
union all
select '':username'' from dual', 'pmtransid,pmfldname,pminctransid,pmcnd', 'pmtransid,pmfldname,pminctransid,pmcnd', 'ALL', NULL, 'API', 1);

>>

<<

INSERT INTO executeapidef (executeapidefid, cancel, sourceid, mapname, username, modifiedon, createdby, createdon, wkid, app_level, app_desc, app_slevel, cancelremarks, wfroles, execapidefname, execapiurl, execapiparameterstring, execapiheaderstring, execapirequeststring, execapimethod, execapibasedon, stype, execapiform, execapitransid, execapifilterstring, execapilprintformnames, execapiformattachments, execapiiview, execapiiviewname, execapiiparams, sql_editor_execapisqltext, apicategory, apiresponsetype, apiresponseformat, execapibodyparamstring, execapiauthstring) VALUES(1239880000000, 'F', 0, NULL, 'admin', '2024-09-05', 'admin', '2024-08-05', NULL, 1, 1, 0, NULL, NULL, 'DAC_Master_Data', 'https://axpertdeveloper.agilecloud.biz/Dev11.3scripts/ASBMenuRest.dll/datasnap/rest/TASBMenuRest/GetSqldata', NULL, NULL, '{"_parameters":[{"getsqldata":{"axpapp":"defschema","sqlname":"DAC_Master_Data","isdropdown":"T","trace":"false"},"defschema":{
  "type": "db",
  "structurl": "",
  "db": "Postgre",
  "driver": "dbx",
  "version": "",
  "dbcon": "172.16.0.135",
  "dbuser": "defschema\\goldendump11",
  "pwd": "",
  "dataurl": ""
},"sqlparams":{"pmtransid":"","pmfldname":"","pminctransid":"","pmcnd":""}}]}', 'Post', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Drop Down', 'Axpert', 'JSON', NULL, NULL);

>>