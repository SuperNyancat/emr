/**
 * 
 */

function rowAdded(rowElement) {
                //clear the input fields for the row
                $(rowElement).find("input").val('');
                //may want to reset <select> options etc
                
                //in fact you may want to submit the form
                saveNeeded();
            }
            function rowRemoved(rowElement) {
                saveNeeded();
                alert( "Removed Row HTML:\n" +  $(rowElement).html() );
            }
            
            function saveNeeded() {
                $('#submit').css('color','red');
                $('#submit').css('font-weight','bold');
                if( $('#submit').val().indexOf('!') != 0 ) {
                    $('#submit').val( '!' + $('#submit').val() );
                }
            }
            
            function beforeSubmit() {
                alert('submitting....');
                return true;
            }
            
            $(document).ready( function() {
                var config = {
                    rowClass : 'meds',
                    addRowId : 'addMedication',
                    removeRowClass : 'removeMedication',
                    formId : 'medicationsForm',
                    rowContainerId : 'form',
                    indexedPropertyName : 'medications',
                    indexedPropertyMemberNames : 'genericName,brandName,dosage,duration,otherDetails',
                    rowAddedListener : rowAdded,
                    rowRemovedListener : rowRemoved,
                    beforeSubmit : beforeSubmit
                };
                new DynamicListHelper(config);
            });