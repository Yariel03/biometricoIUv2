<!--Querido colega programador: 
Cuando escribí este código, solo Dios y yo sabíamos cómo funcionaba.
Ahora solo dios lo sabe!!

Así que si estas tratando de ‘OPTIMIZAR’ esta rutina 
y fracasas (seguramente), por favor, incrementa 
el siguiente contador como una advertencia para el siguiente colega:

Total_horas_perdidas_aqui = 0-->


<%@page contentType='text/html' pageEncoding='UTF-8'%>
<!DOCTYPE html>
<html>
  <link href="assets/css/skins/fulldark.css" rel="stylesheet" type="text/css"/>
    <script src="assets/js/jquery/jquery-2.1.0.min.js"></script>
     Tablas 
    <script src="assets/js/plugins/datatable/jquery.dataTables.min.js"></script>
    <script src="assets/js/plugins/datatable/exts/dataTables.colVis.bootstrap.js"></script>
    <script src="assets/js/plugins/datatable/exts/dataTables.colReorder.min.js"></script>
    <script src="assets/js/plugins/datatable/exts/dataTables.tableTools.min.js"></script>
    <script src="assets/js/plugins/datatable/dataTables.bootstrap.js"></script>
    <script src="assets/js/plugins/jqgrid/jquery.jqGrid.min.js"></script>
    <script src="assets/js/plugins/jqgrid/i18n/grid.locale-en.js"></script>
    <script src="assets/js/plugins/jqgrid/jquery.jqGrid.fluid.js"></script>
    <script src="assets/js/plugins/bootstrap-datepicker/bootstrap-datepicker.js"></script>
    <script src="assets/js/king-table.js"></script>
    <script src="js/jquery.loadingModal.min.js" type="text/javascript"></script>
    <link href="js/css/jquery.loadingModal.min.css" rel="stylesheet" type="text/css"/>
    <%
        String UsuLinea = session.getAttribute("codigoPersona").toString();
    %>
    <div class="main-header">
        <h2>Marcaciones de  Funcionarios</h2>
        <em>Reporte de marcaciones dado un rango de fechas.</em>
    </div>
    <div class="main-content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <!--<li class="active"><a href="#blkTipoCer" data-toggle="tab">Flujo</a></li>-->
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="blkTipoCer">

                    <div class="tab-pane" id="blkAddTipoCer">
                        <div class="row">



                            <div class="col-md-4">
                                <div class="well well-lg knowledge-recent-popular">
                                    <div class="row">

                                        <div class="col-sm-12" align='right'>
                                            <label for><li class="fa fa-group"></li>Migrar los nuevos Funcionarios con código biométrico</label>  <button  type='button' class='btn btn-primary ml-3' onclick="fnMigrarCodigoBiometrico()">Migrar</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
<!--                            <div class="col-md-4">
                                <div class="well well-lg knowledge-recent-popular">
                                    <div class="row">

                                        <div class="col-sm-12" align='right'>
                                            <label for><li class="fa  fa-flag"></li> Migrar nuevas Ubicaciones de relojes biométricos</label>  <button  type='button' class='btn btn-primary ml-3' onclick="migrarUbicacionBiometrico()">Migrar</button>                                        </div>
                                    </div>
                                </div>
                            </div>-->


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</html>