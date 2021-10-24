-- Sequence
create sequence seq_aud_tab nocache;

-- Trigger
create trigger tg_seq_aud_tab
before insert on audit_table
for each row
begin
    :new.aud_id := seq_aud_tab.nextval;
end;
