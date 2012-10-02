<%inherit file='/email/base_plain.mako' />
<%!
    from sterling import proper_cased_name
%>
<table>
    <tr>
        <td>
        <b>
        %if this.payment.developer.domain_name:
            ${ this.payment.developer.domain_name.title().replace('.Com', '.com').replace('.', '<span>.</span>') | n }
        %else:
            ${ this.payment.developer.name }
        %endif
        </b>
        </td>
        <td class="r">
            <b>${ this.transaction_type }</b>
        </td>
    </tr>
</table>

<hr>

<table class="p">
    <tr>
        <td>
            ${ this.local_payment_date.strftime("%B") }
            ${ int(this.local_payment_date.strftime("%d")) },
            ${ this.local_payment_date.strftime("%Y") } at 
            ${ int(this.local_payment_date.strftime("%I")) }:${ this.local_payment_date.strftime("%M%p") }<br>
            Transaction Number: ${ this.transaction_id }
        </td>
    </tr>
</table>

<table class="p mbp5">
    <tr>
        <td>
            ${ ' '.join(proper_cased_name(this.card_name)) }<br>
            ${ this.payment.payer_email_address.replace('.', '<span>.</span>') | n }
        </td>
    </tr>
    <tr>
        <td>
            <div style="margin: 7px 0;color: #666;border-left: 1px solid #999;padding-left: 5px;">${ this.payment.description }</div>
        </td>
    </tr>
</table>

<hr class="large mbp25">

<table>
    <tr>
        <td>
            <b>${ this.card_type }</b>
        </td>
        <td class="r">
            <b>${ 'x' * (11 if this.card_raw_type == 'amex' else 12) }${ this.card_number }</b>
        </td>
    </tr>
    <tr class="line-light">
        <td><b>Total ${ this.transaction_type }</b></td>
        <td class="r"><b>
            ${ this.helpers.format_currency(this.payment.amount_to_charge_payer) } 
        </b></td>
    </tr>
</table>

<hr class="large mtp25">

<table class="p mt1">
    <tr>
        <td>
            The ${ this.transaction_type.lower() } will appear on your statement as:<br>
            &ldquo;${ this.developer.descriptor.replace('.', '<span>.</span>') if this.developer.descriptor else 'Pound LLC' | n }&rdquo;
        </td>
    </tr>
</table>

<table class="p footer">
    <tr>
        <td>
            <span class="text-logo">Pound<span>Pay</span></span><br>
            <a href="mailto:${ parent.reply_to_email() }?subject=Re:%20${ this.subject.replace(' ', '%20') }&amp;body=%0A%0ATransaction%20Number:%20${ this.transaction_id }">${ parent.reply_to_email() }</a><br>
            ${ parent.support_phone_number() }
        </td>
    </tr>
</table>
