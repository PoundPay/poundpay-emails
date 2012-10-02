<%inherit file='/email/base_plain.mako' />
<%!
    from sterling import proper_cased_name
%>
<%def name="cssdefs()">
    ${ parent.cssdefs() }
    .title { font-size: 1em; }
    table.nsi td { color: #666; }
    .deets td { line-height: 1em; font-size: 1em; vertical-align: top; }
    .address { line-height: 1.3em; }
</%def>

<table>
    <tr>
        <td>
        <b class="title">
         ${ this.settlement_type }
        </b>
        </td>
        %if this.marketplace:
        <td class="r">
            <b>
            %if this.marketplace.domain_name:
            ${ this.marketplace.domain_name.title().replace('.Com', '.com').replace('.', '<span>.</span>') | n }
            %else:
            ${ this.marketplace.name }
            %endif
            </b>
        </td>
        %endif
    </tr>
</table>

<hr class="large mbp25 mtp5">

<table class="p nsi">
    <tr>
        <td>
            ${ this.local_settlement_date.strftime("%B") }
            ${ int(this.local_settlement_date.strftime("%d")) },
            ${ this.local_settlement_date.strftime("%Y") } at 
            ${ int(this.local_settlement_date.strftime("%I")) }:${ this.local_settlement_date.strftime("%M%p") }<br>
            Transaction Number: ${ this.transaction_id }
        </td>
    </tr>
</table>

<table class="p mbp5 nsi">
    <tr>
        <td>
            ${ ' '.join(proper_cased_name(this.recipient_name)) }<br>
            ${ this.recipient_email.replace('.', '<span>.</span>') | n }
        </td>
    </tr>
</table>

<hr class="mbp15">

${ next.body() }

<hr class="mbp5">

<table class="p footer nsi">
    <tr>
        <td>
            <span class="text-logo">Pound<span>Pay</span></span><br>
            801 High St Ste 200<br>
            Palo Alto, CA 94301<br>
            <a href="mailto:${ parent.reply_to_email() }?subject=Re:%20${ this.subject.replace(' ', '%20') }&amp;body=%0A%0ATransaction%20Number:%20${ this.transaction_id }">${ parent.reply_to_email() }</a><br>
            ${ parent.support_phone_number() }
        </td>
    </tr>
</table>
