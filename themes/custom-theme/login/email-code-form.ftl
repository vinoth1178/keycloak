<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('emailCode'); section>
    <#if section="header">
       
    <#elseif section="form">
        <form id="kc-otp-login-form" class="${properties.kcFormClass!}" action="${url.loginAction}"
            method="post">

            <div class='logo_img'>
         <img src='${url.resourcesPath}/img/connqt_icon.png' width="150px" height="45px" alt='' />
        </div>
       <div class='welcome_head_mfa'>
               ${msg("Two Step Verification")}
        </div>
       <div class='login_message'>
               ${msg("loginMFAMessage")}
        </div>

            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="emailCode" class="${properties.kcLabelClass!} login_message custom_margin">${msg("loginOtpOneTime")}</label>
                </div>

            <div class="${properties.kcInputWrapperClass!}">
                <input id="emailCode" name="emailCode" autocomplete="off" type="text" class="${properties.kcInputClass!} email_input"
                       autofocus aria-invalid="<#if messagesPerField.existsError('emailCode')>true</#if>"
                       placeholder='Type your OTP here'
                />

                 <div id="kc-form-buttons">
                    <div class="${properties.kcFormButtonsWrapperClass!}">
                        <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!} mfa_continue_btn" name="login" type="submit" value="${msg("doContinue")}" />
                    </div>

                     <div class='login_message resend_code_text'>
                        <span> ${msg("Didn't get the code?")} </span>
                        <input class="mfa_resend_button" name="resend" type="submit" value="${msg("Resend")}"/>
                    </div>

                   <div class='login_message resend_code_text'>
                        <div class="${properties.kcFormOptionsWrapperClass!} ">
                    <span class='backtologin_btn'>
                        <input class="" name="cancel" type="submit" value="&laquo; Back to Login" />
                    </span>
                    </div> 
                    </div>

                   
                </div>

                <#if messagesPerField.existsError('emailCode')>
                    <span id="input-error-otp-code" class="${properties.kcInputErrorMessageClass!}"
                          aria-live="polite">
                        ${kcSanitize(messagesPerField.get('emailCode'))?no_esc}
                    </span>
                </#if>
            </div>
        </div>

            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                    </div>
                </div>

                <div id="kc-form-buttons">
                   
                </div>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>


<script>
    const otpInputs = document.querySelectorAll('.otp_input');

    otpInputs.forEach((input, index) => {
        input.addEventListener('input', (event) => {
            if (event.inputType === 'deleteContentBackward') {
                return;
            }

            const value = event.data;
            if (value && /^[0-9]$/.test(value)) {
                if (index < otpInputs.length - 1) {
                    otpInputs[index + 1].focus();
                }
            }
        });

        input.addEventListener('keydown', (event) => {
            if (event.key === 'Backspace' && index > 0 && !input.value) {
                otpInputs[index - 1].focus();
            }
        });
    });
</script>