<%!
    from sterling import proper_cased_name
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
    <title>Message from PoundPay</title>
    <style type="text/css">
    ${ self.cssdefs() }
    </style>    
</head>
  
<body>
    <table>
        <tr>
            <td>
                ${ next.body() }
            </td>
        </tr>
    </table>
</body>
</html>

<%def name="cssdefs()">
    body {
        padding: 0;
    }
    table { width: 320px; }
    p { line-height: 125%; margin-top: 0; margin-bottom: 1em; padding: 0; border-collapse: collapse; }
    table.p { margin-top: 0; margin-bottom: 1em; padding: 0; border-collapse: collapse; }
    table.p td { line-height: 125%; }
    body, p, table, .nd, td { font-family: "helvetica neue", helvetica, arial, sans-serif; color: #222; }
    .r { text-align: right; }
    .b { font-weight: bold; }
    
    hr { border: 0; height: 1px; color: #222; background-color: #222; }
    hr.large { height: 3px; }
    
    .nd { text-decoration: none; color: #222; }
    .mt1 { margin-top: 1em; }
    .mb1 { margin-bottom: 1em; }
    .mtp5 { margin-top: 0.5em; }
    .mbp5 { margin-bottom: 0.5em; }
    .mtp15 { margin-top: 0.15em; }
    .mbp15 { margin-bottom: 0.15em; }
    .mtp25 { margin-top: 0.25em; }
    .mbp25 { margin-bottom: 0.25em; }
    .mtp75 { margin-top: 0.75em; }
    .mbp75 { margin-bottom: 0.75em; }
    
    .zero { font-size: 1px; display: none; }
    
    .footer { }
    .reference { display: none !important; }
    
    .text-logo { font-weight: bold; color: #4d4d4d; }
    .text-logo span { color: #fdb913; }
</%def>

<%def name="recipient_name()">\
%if this.payment.recipient and this.payment.recipient.first_name is not None and this.payment.recipient.last_name is not None:
${ ' '.join(proper_cased_name([this.payment.recipient.first_name, this.payment.recipient.last_name])) }\
%else:
${ this.payment.recipient_email_address }\
%endif
</%def>

<%def name="payer_name()">\
${ this.payment.payer.first_name + ' ' + this.payment.payer.last_name if this.payment.payer else this.payment.payer_email_address }\
</%def>

<%def name="reply_to_email()">\
<%
    if hasattr(this, 'payment') and this.payment:
        developer = this.payment.developer
    elif hasattr(this, 'developer') and this.developer:
        developer = this.developer
    else:
        developer = None
    if developer and developer.reply_to:
        reply_to = developer.reply_to
    else:
        reply_to = 'support@poundpay.com'
%>\
${ reply_to }
</%def>

<%def name="support_phone_number()">\
<%
    if hasattr(this, 'payment') and this.payment:
        developer = this.payment.developer
    elif hasattr(this, 'developer') and this.developer:
        developer = this.developer
    else:
        developer = None
    if developer and developer.support_phone_number:
        support_phone_number = developer.support_phone_number
    else:
        support_phone_number = '(888) 339-9883'
%>\
${ support_phone_number }
</%def>
