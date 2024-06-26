{#
Params:
- username: set by controller_logon
#}
{% if q.username %}
    {% if q.is_expired %}
        <h2 class="z-logon-title">{_ Please enter a new password _}</h2>

        <p>{_ Your current password has expired, is not strong enough, or has been found in <a href="https://haveibeenpwned.com/Passwords" target="_blank" rel="noreferrer noopener">public records containing passwords appearing in data breaches</a>. _}</p>
    {% else %}
        <h2 class="z-logon-title">{_ Reset your password _}</h2>
    {% endif %}

    <p>{_ Please enter a new password for your account _} <strong>{{ q.username|escape }}</strong>.</p>
{% endif %}
