<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
        <div class='logo_img'>
          <img src='${url.resourcesPath}/img/connqt_icon.png' width="150px" height="45px" alt='' />
        </div>
        <div class='forgot_pass_title'>
        ${msg("emailForgotTitle")}
          <div class='login_message'> ${msg("emailInstructionInForgotPassword")}</div>
        </div>
    <#elseif section = "form">
        <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="username" name="username"
                     class="${properties.kcInputClass!} email_input" autofocus 
                     value="${(auth.attemptedUsername!'')}" 
                     placeholder='Enter your registered email'
                     aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>

                    <#if messagesPerField.existsError('username')>
                        <span id="input-error-username" class="${properties.kcInputErrorMessageClass!} error_message" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('username'))?no_esc}
                        </span>
                    </#if>
                </div>
            </div>
            <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!} custom_btn" type="submit" value="${msg("doSubmit")}"/>
                </div>
            </div>

         
        </form>

            <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!} backtologin_btn">
                        <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                    </div>
                </div>
   
    </#if>
</@layout.registrationLayout>
