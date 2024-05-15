<#macro logoutOtherSessions>
    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
        <div class="${properties.kcFormOptionsWrapperClass!}">
            <div class="checkbox">
                <label class='checkbox_input'>
                    <input type="checkbox"  id="logout-sessions" name="logout-sessions" value="on" checked>
                    ${msg("logoutOtherSessions")}
                </label>
            </div>
        </div>
    </div>
</#macro>
