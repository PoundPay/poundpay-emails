<%inherit file='/email/recipient/payments_settled.mako' />
<table class="deets">
    <tr>
        <td colspan="6">
            <b>PayPal</b>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            Sent To
        </td>
        <td class="r" colspan="4">
            ${ this.paypal_email_address.replace('.', '<span>.</span>') | n }
        </td>
    </tr>
</table>
<table class="deets">
    <tr>
        <td colspan="3">
            Available
        </td>
        <td class="r" colspan="3">
            Now
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <b>Amount Deposited</b>
        </td>
        <td class="r" colspan="3">
            <b>${ this.helpers.format_currency(this.amount) }</b>
        </td>
    </tr>
</table>