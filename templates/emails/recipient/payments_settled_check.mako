<%inherit file='/email/recipient/payments_settled.mako' />
<table class="deets">
    <tr>
        <td>
            Paid To
        </td>
        <td class="r">
            ${ this.check_name }
        </td>
    </tr>
    <tr>
        <td>
            Sent To
        </td>
        <td class="r address">
            ${ this.check_address | n }
        </td>
    </tr>
    <tr>
        <td>
            Mailed
        </td>
        <td class="r">
            ${ this.mailing_date.strftime("%B") }
            ${ int(this.mailing_date.strftime("%d")) },
            ${ this.mailing_date.strftime("%Y") }
        </td>
    </tr>
    <tr>
        <td>
            <b>Check Amount</b>
        </td>
        <td class="r">
            <b>${ this.helpers.format_currency(this.amount) }</b>
        </td>
    </tr>
</table>