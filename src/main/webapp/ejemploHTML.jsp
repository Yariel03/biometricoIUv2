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
    <!-- Tablas -->
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


    <div class="main-header">
        <h2>Usuarios</h2>
        <em>Usuarios inscritos en la plataforma.</em>
    </div>
    <div class="main-content">
        <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#blkDocente" data-toggle="tab">Usuarios</a></li>
                <li><a href="#blkAddDocente" data-toggle="tab">Agregar usuario</a></li>
            </ul>
            <div class="tab-content">
                <div class="active tab-pane" id="blkDocente">
                    <div class="row">
                        <div class="widget widget-table">
                            <div class="widget-header">
                                <h3><i class="fa fa-table"></i> Docentes.</h3> 
                            </div>
                            <div class="widget-content">

                                <table id="featured-datatable" class="table table-sorting table-hover table-bordered datatable">
                                    <thead>
                                        <tr>
                                            <th>Cédula</th>
                                            <th>Nombres</th>
                                            <th>Apellido paterno</th>
                                            <th>Apellido materno</th>
                                            <th>Correo institucional</th>
                                            <th>Correo personal</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="tab-pane" id="blkAddDocente">

                    <div class="row">
                        <div class="col-md-12">
                            <div class="well well-lg knowledge-recent-popular">
                                <div class="row">
                                    <form role="form" id="FrmAddUsua">
                                        
                                        
                                    </form>
                                </div>
                            </div>
                            <div class="col-sm-12" align='right'>
                                <button  type='button' class='btn btn-primary' onclick="clicAddPersona()" >Agregar usuario</button>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>


</html>