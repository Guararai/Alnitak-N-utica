import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_language_selector.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import '/services/bluetooth_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'settings_model.dart';
export 'settings_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class YourModel {
  bool? switchValue2;
  String? extraMessage;

  YourModel({
    this.switchValue2,
    this.extraMessage,
  });
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late SettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsModel());

    _model.switchValue1 = false;
    _model.switchValue2 = false;
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'contato@alnitak.com.br',
    );
    
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      final Uri webGmailUri = Uri.parse(
        'https://mail.google.com/mail/?view=cm&fs=1&to=contato@alnitak.com.br'
      );
      if (await canLaunchUrl(webGmailUri)) {
        await launchUrl(webGmailUri, mode: LaunchMode.externalApplication);
      }
    }
  }

  Future<void> _launchWhatsApp() async {
    final Uri whatsAppUri = Uri.parse('https://wa.me/5511957748787');
    
    if (await canLaunchUrl(whatsAppUri)) {
      await launchUrl(whatsAppUri, mode: LaunchMode.externalApplication);
    } else {
      // Fallback to tel
      final Uri telUri = Uri.parse('tel:+5511957748787');
      if (await canLaunchUrl(telUri)) {
        await launchUrl(telUri);
      }
    }
  }

  void _showHelpOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Entre em contato',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                  fontFamily: 'Inter',
                  letterSpacing: 0.0,
                ),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.email_outlined, color: Color(0xFF379FCB)),
                title: const Text('Enviar e-mail'),
                subtitle: const Text('contato@alnitak.com.br'),
                onTap: () {
                  Navigator.pop(context);
                  _launchEmail();
                },
              ),
              ListTile(
                leading: const Icon(Icons.phone_outlined, color: Color(0xFF25D366)),
                title: const Text('WhatsApp'),
                subtitle: const Text('(11) 95774-8787'),
                onTap: () {
                  Navigator.pop(context);
                  _launchWhatsApp();
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(20.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            actions: const [],
            centerTitle: false,
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 80.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/LOGO_DEFINITIVA_FINAL_Cheia.webp',
                          width: 40.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'gj2yt8p1' /* Definições */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color: const Color(0xFFF2F2F2),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'buw19k5x' /* Localização */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 60.0,
                                                height: 40.0,
                                                decoration:
                                                    const BoxDecoration(),
                                                child: Switch.adaptive(
                                                  value: _model.switchValue1!,
                                                  onChanged: (newValue) async {
                                                    safeSetState(() =>
                                                        _model.switchValue1 =
                                                            newValue);
                                                  },
                                                  activeColor:
                                                      const Color(0xFF379FCB),
                                                  activeTrackColor:
                                                      const Color(0xFF379FCB),
                                                  inactiveTrackColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .alternate,
                                                  inactiveThumbColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                              ),
                                            ].divide(
                                                const SizedBox(width: 12.0)),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 330.0,
                                        child: Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'ESP32',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          Switch.adaptive(
                                            value: _model.switchValue2!,
                                            onChanged: (newValue) async {
                                              final bluetoothService =
                                                  BluetoothService();

                                              if (newValue) {
                                                // Tentando conectar
                                                showDialog(
                                                  context: context,
                                                  barrierDismissible: false,
                                                  builder: (context) => const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                );

                                                bool connected =
                                                    await bluetoothService
                                                        .connectToESP32();

                                                Navigator.pop(context);

                                                if (connected) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                          'Conectado à ESP32'),
                                                      backgroundColor:
                                                          Colors.green,
                                                    ),
                                                  );
                                                  setState(() {
                                                    _model.switchValue2 = true;
                                                    _model.extraMessage =
                                                        null;
                                                  });
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                          'Falha ao conectar. Verifique as permissões e se a ESP32 está pareada.'),
                                                      backgroundColor:
                                                          Colors.red,
                                                    ),
                                                  );
                                                  setState(() {
                                                    _model.switchValue2 = false;
                                                    _model.extraMessage =
                                                        'Falha ao conectar. Verifique as permissões e se a ESP32 está pareada.' as Null;
                                                  });
                                                }
                                              } else {
                                                // Desconectando
                                                await bluetoothService
                                                    .disconnect();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        'Desconectado da ESP32'),
                                                  ),
                                                );
                                                setState(() {
                                                  _model.switchValue2 = false;
                                                  _model.extraMessage =
                                                      null;
                                                });
                                              }
                                            },
                                            activeColor:
                                                const Color(0xFF379FCB),
                                            activeTrackColor:
                                                const Color(0xFF379FCB),
                                            inactiveTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            inactiveThumbColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 330.0,
                                        child: Divider(
                                          thickness: 1.0,
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 8.0, 0.0, 8.0),
                                        child: FlutterFlowLanguageSelector(
                                          height: 40.0,
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          borderColor: Colors.transparent,
                                          dropdownIconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          borderRadius: 8.0,
                                          textStyle: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                letterSpacing: 0.0,
                                              ),
                                          hideFlags: true,
                                          flagSize: 24.0,
                                          flagTextGap: 8.0,
                                          currentLanguage:
                                              FFLocalizations.of(context)
                                                  .languageCode,
                                          languages: FFLocalizations.languages(),
                                          onChanged: (lang) =>
                                              setAppLanguage(context, lang),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 24.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'hbpj78uo' /* Suporte */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Inter',
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: const Color(0xFFF2F2F2),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        InkWell(
                                          onTap: _showHelpOptions,
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 8.0, 0.0, 8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      FFLocalizations.of(context)
                                                          .getText(
                                                        'ft4nw8o4' /* Ajuda */,
                                                      ),
                                                      style: FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      'contato@alnitak.com.br • (11) 95774-8787',
                                                      style: FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                            fontSize: 11.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      onTap: _launchEmail,
                                                      child: Icon(
                                                        Icons.email_outlined,
                                                        color: const Color(0xFF379FCB),
                                                        size: 20.0,
                                                        semanticLabel: 'Enviar e-mail',
                                                      ),
                                                    ),
                                                    const SizedBox(width: 8.0),
                                                    InkWell(
                                                      onTap: _launchWhatsApp,
                                                      child: Icon(
                                                        Icons.phone_outlined,
                                                        color: const Color(0xFF25D366),
                                                        size: 20.0,
                                                        semanticLabel: 'WhatsApp',
                                                      ),
                                                    ),
                                                    const SizedBox(width: 4.0),
                                                    Icon(
                                                      Icons.navigate_next_rounded,
                                                      color: FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                      size: 24.0,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 330.0,
                                          child: Divider(
                                            thickness: 1.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0.0, 8.0, 0.0, 8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Versão do app',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                              Text(
                                                '23.09.0',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 28.0)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}