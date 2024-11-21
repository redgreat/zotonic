<p>{_ You must set your two-factor authentication passcode now. Next time you sign in you will need to enter the two-factor authentication passcode. _}</p>
<p>{_ Scan the two-factor authentication QR code with an app such as <a href="https://support.google.com/accounts/answer/1066447">Google Authenticator</a> or <a href="https://duo.com/product/trusted-users/two-factor-authentication/duo-mobile">Duo Mobile</a>. _}</p>

<div style="margin: 50px 0">
{% with m.auth2fa.new_totp_image_url[q['code-new']] as totp %}
    <p style="text-align: center">
        <img src="{{ totp.url }}" style="width: 200px; height: 200px; max-width: 90%">
    </p>

    <p style="text-align: center">
        <input readonly
               type="hidden"
               value="{{ totp.secret }}"
               name="code-new"
               style="text-align: center; border: none;">
        <a class="btn btn-xs btn-default"
           data-onclick-topic="model/clipboard/post/copy"
           data-text="{{ totp.secret }}"
        >
            <span class="fa fa-copy"></span> {_ Copy _}
        </a>
    </p>
{% endwith %}
</div>

<div class="form-group {% if q.error == 'set_passcode_error' %}has-error{% endif %}">
    <p>{_ After you scanned the QR code, please enter the passcode generated by your two-factor authentication app below. _}</p>

    <label for="password" class="control-label">{_ Passcode generated by your app _}</label>
    <input class="form-control {% if not is_reset %}do_autofocus{% endif %}" type="text" id="test_passcode" name="test_passcode" value="" autocomplete="one-time-code" placeholder="{_ Two-factor passcode _}" inputmode="numeric" pattern="^[0-9]+$" required>
</div>

{% if q.timestamp and not m.auth2fa.clock_check[q.timestamp].is_ok %}
    <p>
        <b>{_ Warning. _}</b> {_ The clock of your computer is more than 20 seconds off. This can cause problems with two-factor authentication. _}
    </p>
{% endif %}