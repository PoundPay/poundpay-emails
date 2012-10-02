<%inherit file='/email/recipient/payments_settled.mako' />
<table class="deets">
    <tr>
        <td>
            <b>${ this.bank_name }</b>
        </td>
    </tr>
    <tr>
        <td>
            ${ this.account_type.title() }
        </td>
        <td class="r">
            ${ this.account_number }
        </td>
    </tr>
    <tr>
        <td>
            Available
        </td>
        <td class="r">
            ${ this.date_available.strftime("%B") }
            ${ int(this.date_available.strftime("%d")) },
            ${ this.date_available.strftime("%Y") }
        </td>
    </tr>
    <tr>
        <td>
            <b>Amount Deposited</b>
        </td>
        <td class="r">
            <b>${ this.helpers.format_currency(this.amount) }</b>
        </td>
    </tr>
</table>