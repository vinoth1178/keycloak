<#import "template.ftl" as layout>
<#import "password-commons.ftl" as passwordCommons>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <#if section = "header">
 <div class='logo_img'>
          <img src='${url.resourcesPath}/img/connqt_icon.png' width="150px" height="45px" alt='' />
        </div>

        <div class='welcome_head'>
          ${msg("changePasswordHeading")}
        </div>
        
    <#elseif section = "form">
        <form id="kc-passwd-update-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!} welcome_title">
                    <label for="password-new" class="${properties.kcLabelClass!}">${msg("passwordNew")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <div class="${properties.kcInputGroup!}">
                        <input type="password" id="password-new" name="password-new" class="${properties.kcInputClass!} 
                               email_input password_input"
                               autofocus autocomplete="new-password"
                               aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                               
                        />
                        <button class="eye_icon" type="button" aria-label="${msg('showPassword')}"
                                aria-controls="password-new"  data-password-toggle
                                data-icon-show="${properties.kcFormPasswordVisibilityIconShow!}" data-icon-hide="${properties.kcFormPasswordVisibilityIconHide!}"
                                data-label-show="${msg('showPassword')}" data-label-hide="${msg('hidePassword')}">
                            <i class="${properties.kcFormPasswordVisibilityIconShow!}" aria-hidden="true"></i>
                        </button>
                    </div>

                    <#if messagesPerField.existsError('password')>
                        <span id="input-error-password" class="${properties.kcInputErrorMessageClass!} error_message" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('password'))?no_esc}
                        </span>
                    </#if>
                </div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="password-confirm" class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <div class="${properties.kcInputGroup!}">
                        <input type="password" id="password-confirm" name="password-confirm"
                               class="${properties.kcInputClass!} email_input password_input"
                               autocomplete="new-password"
                               aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                        />
                        <button class="eye_icon" type="button" aria-label="${msg('showPassword')}"
                                aria-controls="password-confirm"  data-password-toggle
                                data-icon-show="${properties.kcFormPasswordVisibilityIconShow!}" data-icon-hide="${properties.kcFormPasswordVisibilityIconHide!}"
                                data-label-show="${msg('showPassword')}" data-label-hide="${msg('hidePassword')}">
                            <i class="${properties.kcFormPasswordVisibilityIconShow!}" aria-hidden="true"></i>
                        </button>
                    </div>

                    <#if messagesPerField.existsError('password-confirm')>
                        <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!} error_message" aria-live="polite">
                            ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                        </span>
                    </#if>

                </div>
            </div>

            <div class="${properties.kcFormGroupClass!} change_pass_footer">
            <div class='checkbox_input'>
                <@passwordCommons.logoutOtherSessions/>
            </div>

                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <#if isAppInitiatedAction??>
                    <div>
                        <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!} custom_btn" type="submit" value="${msg("Change Password")}" />
                        <div class='further_instruction'> 
                            <span class='login_message'>
                            ${msg("If you need further assistance, contact our support team - ")}
                            </span>
                            <span class='sample_data'>
                            ${msg("sample@gmail.com / +44 20 7123 4567")}
                            </span>
                        </div>
                    </div>    
                    <#else>
                        <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}" />
                    </#if>
                </div>
            </div>
        </form>
        <script type="module" src="${url.resourcesPath}/js/passwordVisibility.js"></script>
    </#if>
</@layout.registrationLayout>
